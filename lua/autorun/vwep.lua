vwep = vwep or {}

vwep.info = vwep.info or {}
vwep.info.name = "Vanguard Weapon Base"
vwep.info.abbreviation = "VWEP"
vwep.info.description = "A simple weapon base for Garry's Mod."
vwep.info.author = "Riggs"
vwep.info.version = "0.0.1"
vwep.info.color = Color(255, 100, 0)

vwep.util = vwep.util or {}

function vwep.util:GetPlayers()
    local players = {}

    for _, v in player.Iterator() do
        if ( v:IsBot() ) then continue end
        table.insert(players, v)
    end

    return players
end

function vwep.util:Message(...)
    local args = { ... }

    MsgC(vwep.info.color, "[VWEP] ", Color(255, 255, 255), unpack(args), "\n")
end

function vwep.util:Notify(ply, message)
    if ( !IsValid(ply) ) then return end
    if ( ply:IsBot() ) then return end

    if ( CLIENT ) then
        chat.AddText(vwep.info.color, "[VWEP] ", Color(255, 255, 255), message)
    else
        net.Start("VWEP.Notify")
            net.WriteString(message)
        net.Send(ply)
    end
end

function vwep.util:NotifyAll(message)
    for _, v in ipairs(vwep.util:GetPlayers()) do
        vwep.util:Notify(v, message)
    end
end

function vwep.util:NotifyAdmins(message)
    for _, v in ipairs(vwep.util:GetPlayers()) do
        if ( v:IsAdmin() ) then
            vwep.util:Notify(v, message)
        end
    end
end

function vwep.util:Include(fileName, realm)
    if ( !fileName ) then
        self:Message("Attempted to include a file with no name.")
        return
    end

    self:Message("Including file \"" .. fileName .. "\".")

    if ( ( realm == "server" or fileName:find("sv_") ) and SERVER ) then
        return include(fileName)
    elseif ( realm == "shared" or fileName:find("shared.lua") or fileName:find("sh_") ) then
        if ( SERVER ) then
            AddCSLuaFile(fileName)
        end

        return include(fileName)
    elseif ( realm == "client" or fileName:find("cl_") ) then
        if ( SERVER ) then
            AddCSLuaFile(fileName)
        else
            return include(fileName)
        end
    end
end

function vwep.util:IncludeDir(directory)
    self:Message("Including directory \"" .. directory .. "\".")

    for _, v in ipairs(file.Find(directory .. "/*.lua", "LUA")) do
        vwep.util:Include(directory .. "/" .. v)
    end
end

do
    if ( SERVER ) then
        util.AddNetworkString("VWEP.Notify")
    else
        net.Receive("VWEP.Notify", function()
            local message = net.ReadString()

            vwep.util:Notify(LocalPlayer(), message)
        end)
    end
end

vwep.util:IncludeDir("vwep")

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
    end)
end