vwep = vwep or {}

vwep.info = vwep.info or {}
vwep.info.name = "Vanguard Weapon Base"
vwep.info.abbreviation = "VWEP"
vwep.info.description = "A simple weapon base for Garry's Mod."
vwep.info.author = "Riggs"
vwep.info.version = "0.0.1"
vwep.info.color = Color(255, 100, 0)

// Include the utility functions, first.
AddCSLuaFile("vwep/sh_util.lua")
include("vwep/sh_util.lua")

vwep.util:IncludeDir("vwep/modules")

http.Fetch("https://raw.githubusercontent.com/Minerva-Servers/vwep/main/VERSION.txt", function(body)
    if ( body == vwep.info.version ) then
        vwep.util:Message("You are using the latest version of " .. vwep.info.name .. " (" .. vwep.info.version .. ").", vwep.info.color)
    else
        vwep.util:Message("You are using an outdated version of " .. vwep.info.name .. " (" .. vwep.info.version .. "). The latest version is " .. body .. ".", vwep.info.color)
    end
end)