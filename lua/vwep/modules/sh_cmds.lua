concommand.Add("vwep_print_ammonames", function()
    local ammoTable = game.GetAmmoTypes()
    for k, v in ipairs(ammoTable) do
        MsgC(vwep.info.color, "[VWEP] ", color_white, "Ammo - " .. v .. "\n")
    end
end)

if ( CLIENT ) then
    concommand.Add("vwep_toggle_devmode", function(ply)
        if ( !IsValid(ply) ) then return end

        ply:SetNW2Bool("VWEP.DevMode", !ply:GetNW2Bool("VWEP.DevMode", false))

        vwep.util:Notify(ply, "Developer mode has been " .. ( ply:GetNW2Bool("VWEP.DevMode", false) and "enabled" or "disabled" ) .. ".")
    end)
end