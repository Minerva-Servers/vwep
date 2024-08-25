vwep = vwep or {}

vwep.info = vwep.info or {}
vwep.info.name = "Vanguard Weapon Base"
vwep.info.abbreviation = "VWEP"
vwep.info.description = "A simple weapon base for Garry's Mod."
vwep.info.author = "Riggs"
vwep.info.version = "0.1.0"
vwep.info.color = Color(255, 100, 0)

// Include the utility functions, first.
AddCSLuaFile("vwep/sh_util.lua")
include("vwep/sh_util.lua")

vwep.util:IncludeDir("vwep/modules")

local install = "https://github.com/Minerva-Servers/vwep/archive/refs/heads/main.zip"
http.Fetch("https://raw.githubusercontent.com/Minerva-Servers/vwep/main/VERSION.txt", function(body)
    if ( body == vwep.info.version ) then
        if ( SERVER ) then
            vwep.util:Message("You are using the latest version of " .. vwep.info.name .. " (" .. vwep.info.version .. ").")
        else
            vwep.util:Message("This server is using the latest version of " .. vwep.info.name .. " (" .. vwep.info.version .. ").")
        end
    else
        if ( SERVER ) then
            vwep.util:Message(Color(255, 0, 0), "You are using an outdated version of " .. vwep.info.name .. " (" .. vwep.info.version .. "). The latest version is " .. body .. " and can be downloaded using the following link: " .. install .. ".")
        else
            vwep.util:Message(Color(255, 0, 0), "This server is using an outdated version of " .. vwep.info.name .. " (" .. vwep.info.version .. "). The latest version is " .. body .. " and can be downloaded using the following link: " .. install .. ".")
        end
    end
end)