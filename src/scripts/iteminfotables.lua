damage_type_table = {
    bash = {"blast", "pound", "crush", "suction", "beating", "slap", "punch", "smash", "stinging lash", "crushing force", "charge", "peck"},
    pierce = {"stab", "bite", "pierce", "charge", "scratch", "peck", "sting", "chomp", "gore",  "thrust"},
    slash = {"slice", "slash", "whip", "claw", "cleave", "chop", "cut", "rending gale", "flogging", "hack", "rend", "rake", "tear"},
    energy = {"magic", "chaotic blast", "asphyxiation", "burst of energy"},
    light = {"searing light", "brilliant radiance", "blinding slash", "blast of light",   "piercing ray", "searing beama"},
    holy = {"wrath", "divine power", "heavenly cut", "crushing wrath",   "righteous wrath", "holy assault"},
    negative = {"defilement", "infernal power", "black light", "unholy cut",   "malefic attack", "defiling smash", "piercing evil"},
    poison = {"poisonous bite", "venomous slash", "venomous cloud",   "blast of poison", "noxious force", "piercing venoms"},
    mental = {"mental assault"},
    acid = {"acidic bite", "caustic slime", "corrosive slice", "wave of acid",    "caustic smash", "acrid stab", "penetrating acid", "digestion"},
    lightning = {"shocking bite", "electrical discharge"},
    fire = {"flaming bite", "searing cut", "burn", "blazing slash", "fiery blast",    "burning thrust", "arcing flames", "piercing fire", "oppressive heat",   "raging flames", "whirling flames", "molten smash"},
    cold = {"icy grip", "frigid chop", "freezing cut", "icy blast", "piercing cold",    "frigid smash", "blast of ice", "biting cold"},
    water = {"drowning", "surge of water", "slashing wave", "crashing wave",    "blast of water", "jet of water", "wave of water"},
}

item_type_table = {"weapon", "container", "drink container", "food", "furniture", "instrument", "key", "light", "miscellaneous object", "npc corpse", "parchment", "pen", "pill", "poison ingredient", "potion", "scroll", "talisman", "trap ingredient", "treasure", "wand", "artifact", "armor", "clothing", "shield"}

weapon_type_table = {"axe", "bow", "dagger", "exotic", "flail", "mace", "polearm", "spear", "staff", "sword", "whip"}

wear_flags_table = {"about", "arms", "back", "body", "claws", "ears", "face", "feet", "feet hindpaws claws", "finger", "foreclaws", "forepaws", "hands", "head", "hindpaws", "hold", "hooves", "horns", "legs", "neck", "shield", "tail", "waist", "wield", "wings", "wrist"}


item_flags_table = {
    anti_evil = "People of a dark heart cannot use it",
    anti_good = "It is unusable for those of a pure soul",
    anti_neutral = "Those with a balanced soul cannot use it",
    bard_only = "It is meant for a bard or a minstrel",
    bless = "It has been imbued with a blessing",
    chaos = "A chaotic, uneven aura surrounds it",
    chaotic_only = "Only those of chaotic nature could use it",
    dark = "It seems to be dark and cloaked in shadows",
    druid_only = "It appears to have been made for a druid",
    dwarf_only = "Only a dwarf could possibly use it",
    elf_only = "Only an elf could put it to use",
    evil = "It has a chilling aura of evil",
    female_only = "It is meant for a woman",
    glowing = "It radiates light",
    gnome_only = "It seems to be made for a gnome to use",
    good = "It shines with a pure, goodly aura",
    half_elf_only = "Only a half-elf could use it",
    humming = "It emanates sound",
    invoker_only = "Only an invoker could put it to use",
    mage_only = "Only a student of the arcane arts could use it",
    magic = "A magical aura surrounds it",
    necromancer_only = "Only a necromancer could utilize it",
    nodrop = "It can't be dropped with ease",
    noremove = "It can't be removed",
    orderly_only = "It appears to be made for a true paladin",
    transparent = "It is transparent",
    concealed = "It is easily concealed",
    rot_death = "Upon death, it will crumble",
    neutral_ethos_only = "It is for those who understand the balance between law and chaos",
}


--[[

-- Missing string for some:

item_flags_table = {
    "anti_evil" = "People of a dark heart cannot use it.",
    "anti_good" = "It is unusable for those of a pure soul",
    "anti_neutral" = "Those with a balanced soul cannot use it.",
    "anti_paladin_only"
    "arial_only"
    "assassin_only"
    "bard_only" = "It is meant for a bard or a minstrel",
    "bless" = "It has been imbued with a blessing.",
    "centaur_only"
    "chaos" = "A chaotic, uneven aura surrounds it.",
    "chaotic_only" = "Only those of chaotic nature could use it.",
    "communer_only"
    "conjurer_only"
    "dark" = "It seems to be dark and cloaked in shadows.",
    "druid_only" = "It appears to have been made for a druid",
    "dwarf_only" = "Only a dwarf could possibly use it",
    "elf_only" = "Only an elf could put it to use",
    "empire_only"
    "evil" = "It has a chilling aura of evil",
    "felar_only"
    "female_only" = "It is meant for a woman",
    "giant_only"
    "glowing" = "It radiates light.",
    "gnome_only" = "It seems to be made for a gnome to use",
    "goblin_only"
    "good" = "It shines with a pure, goodly aura",
    "half_elf_only" = "Only a half-elf could use it",
    "healer_only"
    "human_only"
    "humming" = "It emanates sound.",
    "invis"
    "invoker_only" = "Only an invoker could put it to use",
    "lawful_only"
    "mage_only" = "Only a student of the arcane arts could use it",
    "magic" = "A magical aura surrounds it",
    "male_only"
    "necromancer_only" = "Only a necromancer could utilize it",
    "nodrop" = "It can't be dropped with ease",
    "noremove" = "It can't be removed",
    "orc_only"
    "orderly_only" = "It appears to be made for a true paladin",
    "paladin_only"
    "ranger_only"
    "saurian_only"
    "shaman_only"
    "shapeshifter_only"
    "size_large_only"
    "size_small_only"
    "thief_only"
    "transmuter_only"
    "transparent" = "It is transparent",
    "warrior_only",
        
    "concealed" = "It is easily concealed",
    "rot death" = "Upon death, it will crumble",
}

]]