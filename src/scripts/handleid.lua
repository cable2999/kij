--[[
Things we can get from an id:

strings:

item.name
item.item_type
item.wear_flags
item.material
item.armor_class
item.weapon_type
item.weapon_flags
item.damdice
item.keywords

numbers:

item.level
item.weight
item.weapon_avg
item.worth

tables:

item.affects
item.flags

wear_flags:
about
arms
back
body
claws
ears
face
feet
feet hindpaws claws
finger
foreclaws
forepaws
hands
head
hindpaws
hold
hooves
horns
legs
neck
shield
tail
waist
wield
wings
wrist

flags:
anti_evil
anti_good
anti_neutral
anti_paladin_only
arial_only
assassin_only
bard_only
bless
centaur_only
chaos
chaotic_only
communer_only
conjurer_only
dark
druid_only
dwarf_only
elf_only
empire_only
evil
felar_only
female_only
giant_only
glowing
gnome_only
goblin_only
good
half_elf_only
healer_only
human_only
humming
invis
invoker_only
lawful_only
mage_only
magic
male_only
necromancer_only
nodrop
noremove
orc_only
orderly_only
paladin_only
ranger_only
saurian_only
shaman_only
shapeshifter_only
size_large_only
size_small_only
thief_only
transmuter_only
transparent
warrior_only

]]


teststring = id_table[292]["id"]
--display(teststring)
--display(string.split(teststring, "%."))

function handle_id(idstring)
  
  idstring = idstring.gsub(idstring, "\n", "")
  --display(string.split(idstring, "%."))
  display(idstring)

  
  local item = {}
  
  item.name, item.keywords = string.match(idstring, "^(.-) can be referred to as\%s+'(.-)'%.")
  item.worth = tonumber(string.match(idstring, "It is worth (%d+) copper,"))
  item.level = tonumber(string.match(idstring, "and is of the (%d+)%w%w level of power."))
  item.item_type = string.match(idstring, "It is a (%w+)")
  -- This is super lazy, but meh
  if item.item_type == "two" then
    item.weapon_flags = "two-handed"
    item.item_type = string.match(idstring, "It is a two%-handed (%w+)")
  end
  

  if not item.item_type then
    item.item_type, item.wear_flags = string.match(idstring, "It is (%w+) worn on (%w+)%.")
  end
  if not item.item_type then
    item.item_type, item.wear_flags = string.match(idstring, "It is (%w+) worn (%w+) the body%.")
  end
  if item.wear_flags == "on" then item.wear_flags = "body" end
   
  if not item.item_type then
    item.item_type, item.wear_flags = string.match(idstring, "It is (%w+) worn .- the (%w+)%.")
  end
  
  
  
  
  if table.contains(weapon_type_table, item.item_type) then
    item.weapon_type = item.item_type
    item.item_type = "weapon"
    item.wear_flags = "wield"
  end
  
  if table.contains({"staff", "spear", "polearm"}, item.weapon_type) then
    item.weapon_flags = "two-handed"
  end
  
  item.weapon_attack = string.match(idstring, "with an attack type of (.-)%.")
  for type, nouns in pairs(damage_type_table) do
      if table.contains(nouns, item.weapon_attack) then
          item.weapon_damage_type = type
      end
  end
  item.damdice, item.weapon_avg = string.match(idstring, "It can cause (.-) points of damage, at average (%d+)%.")
  
  item.material, item.weight = string.match(idstring, "It is made of (%w+) and weighs (.-)%.")
  item.weight = string.gsub(item.weight, "pounds", "lbs")
  item.weight = string.gsub(item.weight, "ounces", "oz")
  item.weight = convert_lb_oz_to_ounces(item.weight)
  local pierce, bash, slash, magic, elem = string.match(idstring, "When worn, it protects you against piercing for (%d+), bashing for (%d+),  slashing for (%d+), magic for (%d+), and the elements for (%d+) points each.")
  if pierce and bash and slash and magic and elem then
    acstring = "Pierce: "..pierce.." Bash: "..bash.." Slash: "..slash.." Magic: "..magic.." Element: "..elem
    item.armor_class = acstring
  end
  
  local affects = {}
  
  for k, v in string.gmatch(teststring, "your (.-) by ([+-]?%d-)%%?[%s,]") do
    affects[k] = tonumber(v)
  end
  
  item.affects = affects
  
  local flags = {}
  
  if string.match(teststring, "It radiates light.") then
    table.insert(flags, "glowing")
  end
  if string.match(teststring, "It emanates sound.") then
    table.insert(flags, "humming")
  end
  if string.match(teststring, "A magical aura surrounds it.") then
    table.insert(flags, "magic")
  end
  if string.match(teststring, "It seems to be dark and cloaked in shadows.") then
    table.insert(flags, "dark")
  end
  if string.match(teststring, "It has been imbued with a blessing.") then
    table.insert(flags, "bless")
  end
  if string.match(teststring, "It shines with a pure, goodly aura") then
    table.insert(flags, "bless")
  end  
  if string.match(teststring, "Those with a balanced soul cannot use it.") then
    table.insert(flags, "anti_neutral")
  end
  if string.match(teststring, "People of a dark heart cannot use it.") then
    table.insert(flags, "anti_evil")
  end
  if string.match(teststring, "Only those of chaotic nature could use it.") then
    table.insert(flags, "chaotic_only")
  end
  if string.match(teststring, "A chaotic, uneven aura surrounds it.") then
    table.insert(flags, "chaos")
  end
  
  

  
  item.flags = flags
  
  item.spell_level = string.match(teststring, "Within it are contained level (%d+) spell")
  item.spell_level = tonumber(item.spell_level)
  
  local spells = {}
  
  spell1 = string.match(teststring, "spell.-of%s+'(.-)'")
  spell2 = string.match(teststring, " and '(.-)'")
  
  if spell1 ~= nil then 
    table.insert(spells, string.match(teststring, "spells of%s+'(.-)'"))
    --display("First spell")
  end
  if spell2 ~= nil then 
    table.insert(spells, string.match(teststring, " and '(.-)'"))
    --display("Second spell")
  end
  
  if table.size(spells) > 0 then
    item.spells = spells
  end
    
  return(item)
end

display(handle_id(teststring))