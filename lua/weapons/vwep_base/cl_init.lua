VWEP = SWEP

vwep.util:Include("shared.lua")

local lerpFOV
function VWEP:TranslateFOV(fov)
    if !lerpFOV then lerpFOV = 1 end

    local owner = self:GetOwner()
    if !IsValid(owner) then return fov end

    local ft = FrameTime()
    local time = ft

    local bIron = self:GetIronSights()
    lerpFOV = Lerp(time, lerpFOV, bIron and self.IronSightsFOV or 1)

    return fov * lerpFOV
end

function VWEP:AdjustMouseSensitivity()
    local bIron = self:GetIronSights()
    if ( bIron ) then
        return self.IronSightsSensitivity or 0.5
    else
        return self.Sensitivity or 1
    end
end

function VWEP:EnabledDevMode()
    local ply = self:GetOwner()
    if ( !IsValid(ply) ) then return false end

    return ply:GetNW2Bool("VWEP.DevMode", false)
end

function VWEP:DrawHUD()
    if ( self.PostDrawHUD ) then
        self:PostDrawHUD()
    end

    if ( self.PastDrawHUD ) then
        self:PastDrawHUD()
    end
end