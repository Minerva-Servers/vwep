vwep.sounds = vwep.sounds or {}
vwep.sounds.stored = vwep.sounds.stored or {}

function vwep.sounds:Register(name, path, pitch, volume)
    if ( !name or !path ) then return end

    local data = {
        path = path,
        pitch = pitch or 100,
        volume = volume or 1
    }

    sound.Add({
        name = name,
        channel = 1000,
        volume = data.volume,
        level = 100,
        pitch = data.pitch,
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