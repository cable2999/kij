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

--display(finditembyname("a pair of glauruk-hide boots", carrion_items))

function compareitem(itemnew, curitem)
    -- Compares a new item to a current item from authoritative carrion_items

    for key, value in pairs(curitem) do
        if type(value) == "string" or type(value) == "number" then
            if curitem[key] ~= itemnew[key] and itemnew[key] ~= nil then
                message = "Key: "..key.." mismatch.  Current item: "..value.." New item: "..itemnew[key]
                cecho(string.format("<red>Items mismatch!! %s\n", message))
                return false
            end
        end
    end
    cecho("Fields in new item not in current item:\n")
    display(table.complement(itemnew, curitem))

    return true
end



function updateitem(itemnew, itemindex, item_table)
    -- Update an item at index in carrion_items with data from itemnew
    uitem = {}
    curitem = item_table[itemindex]
    
    uitem = table.union(curitem, itemnew)    
    
    display(uitem)
end
