-- Define the table where items will be stored
carrion_items = carrion_items or {}

function fetchCarrionItems()
  local url = "https://carrionfields.net/itemsearch/"
  
  -- getHTTP starts the download and triggers the sysGetHttpDone event when finished
  getHTTP(url)
  cecho("<yellow>Fetching items from Carrion Fields...\n")
end

function handleCarrionItems(_, url, body)
  -- Check if this response is for our specific search URL
  if not url:find("carrionfields.net/itemsearch") then return end
  
  carrion_items = {} -- Clear old data
  
  -- Pattern to find everything inside <div class="item_row ... </div>
  -- We use ".-" for a non-greedy match to get each item individually
  for item_block in body:gmatch('<div class="item_row(.-)</div>') do
    local item = {}
    
    --display(item_block)
    
    item_block = string.gsub(item_block, "&#039;", "'")
    
    -- Extract specific fields using patterns. 
    -- These patterns look for the text between <b> tags or specific classes
    item.name  = string.trim(item_block:match('Name:.-</b>(.-)<b>'))
    item.area_name  = string.trim(item_block:match('<b>Area:.-</b>(.-)<br>'))
    item.item_type  = string.trim(item_block:match('<b>Item Type:.-</b>(.-)\n'))
    item.wear_flags  = string.trim(item_block:match('<b>Wear:.-</b>(.-)\n'))
    item.material  = string.trim(item_block:match('<b>Material:.-</b>(.-)\n'))
    item.level  = tonumber(string.trim(item_block:match('<b>Level:.-</b>(.-)\n')))
    item.weight = convert_lb_oz_to_ounces(string.trim(item_block:match('<b>Weight:.-</b>(.-)<br>')))
    item.flags  = string.trim(item_block:match('<b>Flags:.-</b>(.-)<br>')) or ""
    item.flags = string.split(item.flags)
    
    local affects = {}
    
    for affect, amount in item_block:gmatch('<li>Modifies <span class="affect_name">(.-)</span> by ([+-]?%d+)<br></li>') do
      affects[affect] = tonumber(string.trim(amount))
    end
    
    item.affects = affects

    -- This could be broken up into subkeys, but meh.
    item.armor_class = string.trim(item_block:match('<b>Amor Class:.-</b>(.-)<br>')) or ""
    
    item.weapon_avg, item.weapon_attack = item_block:match('<b>Weapon Damage:</b> average (%d+) %((.-)%)')
    item.weapon_avg = tonumber(item.weapon_avg)
    
    item.weapon_type, item.weapon_flags = item_block:match('b>Weapon Class:</b> (.-)\n(.-)<br>')
    if item.weapon_flags then
      item.weapon_flags = string.gsub(item.weapon_flags, "\n%s+", " ")
      item.weapon_flags = string.gsub(item.weapon_flags, "%s+", "")
      if item.weapon_flags ~= "" then
          item.weapon_flags = item.weapon_flags:match('%((.-)%)')
      end
    end

    if item.weapon_type == nil then
      -- Default values so we don't have to worry later about not having a field.
      item.weapon_type = ""
      item.weapon_flags = ""
      item.weapon_avg = ""
      item.weapon_attack = ""
    end
    

    item.damdice = ""
    item.keywords = ""        
    item.rarity = "common"
    item.worth = ""
    
    table.insert(carrion_items, item)

  end
  
  cecho(string.format("<green>Success! Extracted %d items into 'carrion_items' table.\n", #carrion_items))
  
  -- Optional: Print the first few results to the console to verify
  if #carrion_items > 0 then
    --display(carrion_items[1])
    --display(carrion_items[2])
    --display(carrion_items[3])
  end
end

-- Register the event handler to Mudlet's HTTP system
registerAnonymousEventHandler("sysGetHttpDone", "handleCarrionItems")