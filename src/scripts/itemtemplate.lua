--[[

Attempt to capture what fields an item can have and what type they are.  Incomplete.

From identify:

string: item.name
string: item.keywords

number: item.worth
number: item.level

string: item.item_type
string: item.weapon_type
string: item.weapon_flags
string: item.weapon_attack
string: item.weapon_damage_type -- Derived from weapon_attack
string: item.weapon_damdice
number: item.weapon_avg

string: item.wear_flags     -- This isn't always true.  Depends on item type.
                            -- Can capture this by capturing wear strings into table.

string: item.material
number: item.weight

string: item.armor_class

string: item.max_charges
string: item.cur_charges    -- Not sure this is worth storing.
table:  item.spells         -- This is a simple list (order shouldn't matter)
number: item.spells_level   

table:  item.affects        -- Contains key (affects string) value (number) pairs
                            -- i.e.   affects = { dexterity = -1, hp = 10, moves = -20 }
table:  item.flags          -- This is a simple list (order shouldn't matter)
                            -- Incomplete list


From other data:

string: item.area_name  -- From itemsearch or map.currentArea or manual
string: item.rarity     -- From itemsearch or legendary awareness or manual
string: item.room_id    -- From map.currentRoom


What is considered a full id?


]]
