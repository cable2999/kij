function finditembyname(name, item_table)

    local mitems = {}
    for index, item in ipairs(item_table) do
      --display(item.name)
      --display(name)
      if item.name == name then
        --display(index)
        table.insert(mitems, index)
        --display(lua_table[index])
      end
    end
    return mitems
end

function finditembypartialname(name, item_table)

    local mitems = {}
    for index, item in ipairs(item_table) do
      --display(item.name)
      --display(name)
      if string.match(item.name, name) then
        --display(index)
        table.insert(mitems, index)
        --display(lua_table[index])
      end
    end
    return mitems
end

--display(finditembyname("a pair of glauruk-hide boots", carrion_items))

function compareitem(itemnew, curitem)
    -- Compares a new item to a current item from authoritative carrion_items
    local name = itemnew.name
    for key, value in pairs(curitem) do
        if type(value) == "string" or type(value) == "number" then
            if curitem[key] ~= itemnew[key] and itemnew[key] ~= nil then
                message = "Key: "..key.." mismatch.  Current item: "..value.." New item: "..itemnew[key].." Item name: "..name
                --cecho(string.format("<red>Items mismatch!! %s\n", message))
                return false
            end
        end
    end
    
    local dif = table.complement(itemnew, curitem)
    if #dif > 0 then
      cecho("Fields in new item not in current item:\n")
    end

    return true
end

function unionitems(item1, item2)

  local uitem = {}
  
  for index, value in pairs(item1) do
    if type(value) == "string" or type(value) == "number" then
      if item1[index] == item2[index] or item2[index] == nil then
        uitem[index] = value
      end
    elseif type(value) == "table" then
      --display("HERE")
      --display(table.complement(item1[index], item2[index]))
        
      if table.size(table.complement(item1[index], item2[index])) == 0 then
        uitem[index] = value
      end
    end
  end
 
 for index, value in pairs(item2) do
    if type(value) == "string" or type(value) == "number" then
      if item2[index] == item1[index] or item1[index] == nil then
        uitem[index] = value
      end
    elseif type(value) == "table" then
      --display("HERE")
      --display(table.complement(item1[index], item2[index]))
      
      if table.size(table.complement(item2[index], item1[index])) == 0 then
        uitem[index] = value
      end
    end
  end
 
 
 return uitem
end


function updatebyid(itemid, item_table)
    -- Given an item ID string, attempts to update an existing item or add a new item as appropriate.

    local item = {}
    item = handle_id2(itemid)
    updatebyitem(item, item_table)

end

function updatebyitem(item, item_table)
    -- Given an item, attempts to update an existing item or add a new item as appropriate.

    local mitems = {}
    mitems = finditembyname(item.name, item_table)
    if #mitems == 0 then
        return false
    else
      for index, itemindex in pairs(mitems) do
        if compareitem(item, item_table[itemindex]) then
          cecho("Item ".. itemindex .." updated!\n")
          item_table[itemindex] = unionitems(item, item_table[itemindex])
          return true
        end
      end
    end
end

function addbyid(itemid, item_table)
    local item = {}
    item = handle_id2(itemid)
    addbyitem(item, item_table)
end

function addbyitem(item, item_table)

    --display("No existing item named: '"..item.name.."' found.  Adding a new item.")
    -- Check for area info
    if not item.area_name then
      cecho("No area name for item. Will not add item.")
      return false
    end
    -- Check for rarity info
    if not item.rarity then
      cecho("No rarity info for item. ")
    end
    -- Check for wear_flag info
    if not item.wear_flags then
      cecho("No wear_flag info for item. ")
    end      
    -- Add anyway?

    table.insert(item_table, item)
    return true
     
end