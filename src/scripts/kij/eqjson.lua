function loadEqData(file_path)
    
    -- Check if the file exists
    if not io.exists(file_path) then
        echo("Error: File not found at " .. file_path)
        return nil
    end

    -- 2. Read the file content into a string
    local file = io.open(file_path, "r") -- Open in read mode
    if file then
        local json_string = file:read("*all") -- Read the entire file content
        file:close() -- Close the file
        
        -- 3. Parse the JSON string into a Lua table
        local lua_table = yajl.to_value(json_string)
        
        if lua_table then
            -- Optional: Display the loaded table for verification
            --display(lua_table[1])
            return lua_table
        else
            echo("Error: Failed to parse JSON data.")
            return nil
        end
    else
        echo("Error: Could not open file for reading.")
        return nil
    end
end

function saveEqData(file_path, eqtable)

    local file = io.open(file_path, "w")
    if file then
      file:write(yajl.to_string(eqtable))
      file:close()
      cecho(string.format("<green>Success! Wrote %d items to %s file.\n", #eqtable, file_path))
    else
      cecho("Error: Could not open file for writing.\n")
    end
    
end