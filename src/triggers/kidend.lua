disableTrigger("kid_start")
disableTrigger("kid_capture")
disableTrigger("kid_end")

local kid = handle_id2(kid_capture)

kid.area_name = getAreaTableSwap()[map.currentArea]

-- Something for rarity from a rarity table I need to capture.
display(kid)
if not updatebyitem(kid, carrion_items) then
    if not addbyitem(kid, carrion_items) then
        display("Something is wrong.")
    end
end