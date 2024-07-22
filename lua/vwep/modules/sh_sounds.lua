vwep.sounds = vwep.sounds or {}
vwep.sounds.stored = vwep.sounds.stored or {}

function vwep.sounds:Register(name, path, pitch, volume, level)
    if ( !name or !path ) then return end

    local data = {
        path = path,
        pitch = pitch or 100,
        volume = volume or 1,
        level = level or 100
    }

    sound.Add({
        name = name,
        channel = CHAN_STATIC,
        volume = data.volume,
        level = data.level,
        pitch = istable(data.pitch) and math.random(data.pitch[1], data.pitch[2]) or data.pitch,
        sound = data.path
    })

    self.stored[name] = data

    return data
end

function vwep.sounds:Find(identifier)
    if ( !identifier ) then return end

    for k, v in pairs(self.stored) do
        if ( string.find(string.lower(k), string.lower(identifier)) ) then
            return v
        end
    end
end