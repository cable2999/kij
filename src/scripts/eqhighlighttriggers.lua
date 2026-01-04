-- Script to add temporary triggers so we get feedback on items that need identifying.

-- Initialize a place to store the temporary trigger ids.
temptids = temptids or {}

function createIDHighlightTriggers(item_table)

  numtrig = table.size(item_table)
  cecho("Creating "..numtrig.." highlight triggers.\n")
  
  for index, item in pairs(item_table) do
    --local item = item_table[2799]
    --display(item.name)
  
    local color = "PaleGoldenrod"
    --local codestring = [[cecho("Item Highlight Trigger FIRE")]]
    local codestring = [[selectCaptureGroup(2) fg(]].."\""..color.."\""..[[) resetFormat()]]

    if not item.worth then
      -- items exists in DB, but doesn't have a proper ID.
      color = "PaleGoldenrod"
    elseif not item.area_name then
      -- item exits in DB, but doesn't have an associated area.
      color = "gold"
    else
      color = "forest_green"
    end
    -- Create the trigger
    codestring = [[selectCaptureGroup(2) fg(]].."\""..color.."\""..[[) resetFormat()]]
    local matchstring = "("..item.name..")$"
    local temptid = tempRegexTrigger(matchstring, codestring)
    table.insert(temptids, temptid)
  end
  
end

function deleteIDHighlightTriggers()

  numtrig = table.size(temptids)
  cecho("Removing "..numtrig.." highlight triggers.\n")
  local temptidsremain = {}
  for index, tid in pairs(temptids) do
    if not killTrigger(tid) then
      display("Failed to kill trigger", tid)
      table.insert(temptidsremain, tid)  
    end
  end
  numtrig = table.size(temptidsremain)
  temptids = temptidsremain
  cecho(numtrig.." highlight triggers remain.\n")

end
