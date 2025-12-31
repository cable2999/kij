local profiledir = getMudletHomeDir()
local path = profiledir .. "/kmapdata"

local file_path = path.. "/kitemdb.json"


local itemtable = loadEqData(file_path)

if table.size(itemtable) >= table.size(carrion_items) then
  cecho("Loading ".. table.size(itemtable) .." into table carrion_items.")
else
  cecho("File version has fewer items.  Aborting...")
end

