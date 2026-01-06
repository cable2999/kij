function carrion_items_fix(item_table)

  for index, item in pairs(item_table) do
    --local item = carrion_items[4278]
    for key, value in pairs(item) do
      if key == "spell_level" then
        item["spells_level"] = tonumber(value)
        item[key] = nil
      end
      if key == "damdice" then
        item["weapon_damdice"] = item["damdice"]
        item["damdice"] = nil
      end
      if key == "weapon_attack_type" then
        item["weapon_damage_type"] = item["weapon_attack_type"]
        item["weapon_attack_type"] = nil
      end
    end
  end

end

--carrion_items_fix(carrion_items)