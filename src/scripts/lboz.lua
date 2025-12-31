function convert_lb_oz_to_ounces(weight_str)
    -- Pattern to capture pounds and ounces (optional parts made non-greedy)
    -- It assumes the format has 'lb' and 'oz' labels near the numbers.
    local lbs_str, ozs_str = string.match(weight_str, "(%d+)%s*lb.-(%d+)%s*oz")
    
    -- If the first pattern fails (e.g. only lbs or only oz), try simpler patterns
    if not lbs_str and not ozs_str then
        lbs_str = string.match(weight_str, "(%d+%.?%d*)%s*lb")
        ozs_str = string.match(weight_str, "(%d+%.?%d*)%s*oz")
    end

    -- Convert the captured strings to numbers (tonumber handles nil/missing values as needed)
    local lbs = tonumber(lbs_str) or 0
    local ozs = tonumber(ozs_str) or 0
    
    -- Calculate total ounces: 1 pound = 16 ounces
    local total_ounces = (lbs * 16) + ozs
    
    return total_ounces/16
end