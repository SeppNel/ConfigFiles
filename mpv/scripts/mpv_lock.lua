local locked = false
local osd_time = 2

mp.add_key_binding('Ctrl+l', 'inhibit-input', function ()
    if not locked then
        for _, binding in pairs(mp.get_property_native('input-bindings')) do
            if binding.owner ~= mp.get_script_name() then
                mp.add_forced_key_binding(binding.key, binding.key, nil)
            end
        end
		mp.osd_message("Locked", osd_time)
    else
        for _, binding in pairs(mp.get_property_native('input-bindings')) do
            mp.remove_key_binding(binding.key)
        end
		mp.osd_message("Unlocked", osd_time)
    end

    locked = not locked
end)