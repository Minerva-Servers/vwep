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