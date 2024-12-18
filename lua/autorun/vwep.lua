vwep = vwep or {}

vwep.info = vwep.info or {}
vwep.info.name = "Vanguard Weapon Base"
vwep.info.abbreviation = "VWEP"
vwep.info.description = "A simple weapon base for Garry's Mod."
vwep.info.author = "Riggs"
vwep.info.version = "0.4.1"
vwep.info.color = Color(255, 100, 0)

// Include the utility functions, first.
AddCSLuaFile("vwep/sh_util.lua")
include("vwep/sh_util.lua")

vwep.util:IncludeDir("vwep/modules")

local install = "https://github.com/Minerva-Servers/vwep/archive/refs/heads/main.zip"
local function CheckVersion(response)
    if ( response == vwep.info.version ) then
        if ( SERVER ) then
            vwep.util:Message("You are using the latest version of " .. vwep.info.name .. " (" .. vwep.info.version .. ").")
        else
            vwep.util:Message("This server is using the latest version of " .. vwep.info.name .. " (" .. vwep.info.version .. ").")
        end
    else
        if ( SERVER ) then
            vwep.util:Message(Color(255, 0, 0), "You are using an outdated version of " .. vwep.info.name .. " (" .. vwep.info.version .. "). The latest version is " .. response .. " and can be downloaded using the following link: " .. install .. ".")
        else
            vwep.util:Message(Color(255, 0, 0), "This server is using an outdated version of " .. vwep.info.name .. " (" .. vwep.info.version .. "). The latest version is " .. response .. " and can be downloaded using the following link: " .. install .. ".")
        end
    end
end

hook.Add("Initialize", "VWEP.CheckVersion", function()
    http.Fetch("https://raw.githubusercontent.com/Minerva-Servers/vwep/main/VERSION.txt", function(response)
        CheckVersion(response)
    end)
end)

concommand.Add("vwep_version", function()
    http.Fetch("https://raw.githubusercontent.com/Minerva-Servers/vwep/main/VERSION.txt", function(response)
        CheckVersion(response)
    end)
end)

concommand.Add("vwep_install", function()
    if ( CLIENT ) then
        gui.OpenURL(install)
    else
        vwep.util:Message("You can download the latest version of " .. vwep.info.name .. " using the following link: " .. install .. ".")
    end
end)

if ( CLIENT ) then
    concommand.Add("vwep_toggle_firemode", function(ply, cmd, args)
        if ( !IsValid(ply) or !ply:IsPlayer() ) then return end

        local wep = ply:GetActiveWeapon()
        if ( !IsValid(wep) or !wep.IsVWEP ) then return end

        wep:ToggleFireMode()

        net.Start("VWEP.ToggleFireMode")
        net.SendToServer()

        vwep.util:Message("You have toggled the firemode of your weapon.")
    end)
else
    util.AddNetworkString("VWEP.ToggleFireMode")

    net.Receive("VWEP.ToggleFireMode", function(len, ply)
        if ( !IsValid(ply) or !ply:IsPlayer() ) then return end

        local wep = ply:GetActiveWeapon()
        if ( !IsValid(wep) or !wep.IsVWEP ) then return end

        wep:ToggleFireMode()

        vwep.util:Message(ply, " has toggled the firemode of their weapon.")
    end)
end