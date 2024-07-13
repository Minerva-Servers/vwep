local abbreviation = vwep.info.abbreviation
local color = vwep.info.color

concommand.Add(abbreviation:lower() .. "_print_ammonames", function()
    local ammoTable = game.GetAmmoTypes()
    for k, v in ipairs(ammoTable) do
        MsgC(vwep.info.color, "[VWEP] ", color_white, "Ammo - " .. v .. "\n")
    end
end)

if ( CLIENT ) then
    concommand.Add(abbreviation:lower() .. "_toggle_devmode", function(ply)
        if ( !IsValid(ply) ) then return end

        local devMode = !ply:GetNWBool(abbreviation .. ".DevMode", false)
        ply:SetNWBool(abbreviation .. ".DevMode", devMode)

        vwep.util:Notify(ply, "Developer mode has been " .. ( devMode and "enabled" or "disabled" ) .. ".")
    end)
end