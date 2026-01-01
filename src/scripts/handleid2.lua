local testid = id_table[296]["id"]
--display(testid)
--display(string.split(teststring, "%."))

function handle_id2(idstring)
  
  local item = {}
  -- Remove line breaks
  idstring = idstring.gsub(idstring, "\n", "")
  -- Make all spaces singluar
  idstring = idstring.gsub(idstring, "%s+", " ")
  -- Split on periods.
  idstrings = {}
  idstrings = string.split(idstring, "%.")
  
  --Handle spells line which doesn't have a period to split on.
  for index, string in pairs(idstrings) do
    
    if string.match(string, "Within it .- contained level %d+ spells of") then
      
      poss, pose= string.find(string, "'.*'")
      --display(poss, pose)
      local tempstring = utf8.insert(string, pose+1, '.')
      local tempstrings = string.split(tempstring, "%.")
      display(tempstrings)
      --display(index, string)
      --local tempstring = string.split(string, 
      table.remove(idstrings, index)
      table.insert(idstrings, index, tempstrings[1])
      table.insert(idstrings, index+1, tempstrings[2])
      display(idstrings)
      break
    end  
  end
  
  
  -- Handle line one which is always of the form:
  -- item.name can be referred to as 'item.keywords'
  local linenum = 1
  item.name, item.keywords = string.match(idstrings[linenum], "^(.-) can be referred to as\%s+'(.-)'$")
  
  -- Handle line two which is always of the form:
  -- It is worth item.worth copper, and is of the item.level?? level of power
  local linenum = 2
  item.worth, item.level = string.match(idstrings[linenum], "^It is worth (%d+) copper, and is of the (%d+)%w%w level of power$")
  item.worth, item.level = tonumber(item.worth), tonumber(item.level)
  
  local linenum = 3
  -- Handle line three which gives us item type and additional info depending on type

  -- Dealing with armor/clothing exception case
  local tt = string.match(idstrings[linenum], "^It is (%w+)")
  if tt == "armor" or tt == "clothing" then
    -- Handle face slot "It is armor worn on face"
    if not item.item_type then
      item.item_type, item.wear_flags = string.match(idstrings[linenum], "It is (%w+) worn on (%w+)$")
    end
    -- Handle about/body slot "It is clothing worn about the body"
    if not item.item_type then
      item.item_type, item.wear_flags = string.match(idstrings[linenum], "It is (%w+) worn (%w+) the body$")
    end
    if item.wear_flags == "on" then item.wear_flags = "body" end
    -- Handle no slot  "It is armor."   
    if not item.item_type then
      item.item_type = string.match(idstrings[linenum], "It is (%w+)$")
    end
    -- Generic case "It is clothing worn around the waist." "It is armor worn on the arms." etc.
    if not item.item_type then
      item.item_type, item.wear_flags = string.match(idstrings[linenum], "It is (%w+) worn .- the (%w+)$")
    end
  end
  
  -- Dealing with two-handed weapon exception case
  local tt = string.match(idstrings[linenum], "^It is an? (%w+)")
  if tt == "two" then
    item.weapon_flags = "two-handed"
    item.item_type, item.weapon_attack = string.match(idstrings[linenum], "^It is a two%-handed (%w+) with an attack type of (.-)$")
  end
  if table.contains(weapon_type_table, tt) then
    item.weapon_type = tt
    item.item_type = "weapon"
    item.wear_flags = "wield"
  end

  -- Dealing with weapons that are always two-handed  
  if table.contains({"staff", "spear", "polearm"}, item.weapon_type) then
    item.weapon_flags = "two-handed"
  end

  -- Add a damage type from the table
  if item.item_type == "weapon" then
    item.weapon_attack = string.match(idstrings[linenum], "with an attack type of (.-)$")
    for type, nouns in pairs(damage_type_table) do
        if table.contains(nouns, item.weapon_attack) then
            item.weapon_damage_type = type
        end
    end  
  end
  
  -- Generic case (I think)
  local tt = string.match(idstrings[linenum], "^It is an? (.-)$")
  if not item.item_type then
    item.item_type = tt
  end

  local linenum = 4  
  -- Handle line four which is always of the form:
  -- "It is made of %w+ and weighs %d+ pounds %d+ ounces"
  item.material, item.weight = string.match(idstrings[linenum], "It is made of (%w+) and weighs (.-)$")
  item.weight = string.gsub(item.weight, "pounds", "lbs")
  item.weight = string.gsub(item.weight, "ounces", "oz")
  item.weight = convert_lb_oz_to_ounces(item.weight)
  
  local linenum = 5
  -- Now we know the type, so we can hand remaining lines in a loop probably
  
  for i = linenum, table.size(idstrings), 1 do
    local linedone = false
    -- Handle end of idstring
    if string.match(idstrings[i], "^-------------------------------------------------------------------------------$") then
      linenum = i+1
      break
    end
    
    -- Handle wands next line, which is of the form:
    -- "It can be used a maximum of %d+ times"
    if item.item_type == "wand" or item.item_type == "talisman" then
      item.max_charges = 0
      item.cur_charges = 0
      item.spells = {}
    end
    
    if not linedone then
      display("Unhandled line", idstrings[i])
    end
  end
  

  
  for i = linenum, table.size(idstrings), 1 do
    display("Unhandled line", idstrings[i])
  end

  return(item)
end

display(handle_id2(testid))