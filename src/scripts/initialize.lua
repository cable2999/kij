function kijload()

    carrion_items = carrion_items or {}
    local profiledir = getMudletHomeDir()
    local path = profiledir .. "/kmapdata"

    local file_path = path.. "/kitemdb.json"


    local itemtable = loadEqData(file_path) or {}

    if table.size(itemtable) >= table.size(carrion_items) then
        cecho("Loading ".. table.size(itemtable) .." into table carrion_items.\n")
        carrion_items = itemtable
    else
        cecho("File version has fewer items than active carrion_items.  Aborting...")
    end

end


function initkij()

    kijload()

    -- Register the event handler.
    registerAnonymousEventHandler("handleCarrionItemsCompleted", "updateCarrionItemsFromWeb")
    fetchCarrionItems()

end

function updateCarrionItemsFromWeb(event, item_table)
    
    local lenbefore = #carrion_items
    if #item_table == 0 then
        display("Item table from web empty.  Something has gone wrong!")
    elseif #carrion_items == 0 then
        -- This is a fresh table, just add all the items.
        for index, item in pairs(item_table) do
            carrion_items[index] = item
        end
    else
        for index, item in pairs(item_table) do
            if not updatebyitem(item, carrion_items) then
                --display("New item found.  Adding:", item)
                if not addbyitem(item, carrion_items) then
                    display("Adding item failure on item:", item)
                end
            end
        end
    end
    local lenafter = #carrion_items
    local dif = lenafter - lenbefore
    cecho("Added "..dif.." items from web.")
        
end

-- Initialize on package install
registerAnonymousEventHandler("sysInstallPackage", "initkij")
-- Initialize on profile load
registerAnonymousEventHandler("sysLoadEvent", "initkij")
