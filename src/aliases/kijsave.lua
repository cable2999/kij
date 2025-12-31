local profiledir = getMudletHomeDir()
local path = profiledir .. "/kmapdata"

if not io.exists(path) then lfs.mkdir(path) end


file_path = path.. "/kitemdb.json"


saveEqData(file_path, carrion_items)