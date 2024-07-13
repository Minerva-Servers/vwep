include("shared.lua")

local function eased(t, p1, p2)
    return Lerp(math.ease.OutCirc(t), p1, p2)
end

local function translate(originalVec, originalAng, newVec, newAng, mul)
    mul = mul or 1

    originalAng:RotateAroundAxis(originalAng:Right(), newAng.p * mul)
    originalAng:RotateAroundAxis(originalAng:Up(), newAng.y * mul)
    originalAng:RotateAroundAxis(originalAng:Forward(), newAng.r * mul)

    originalVec = originalVec + newVec.x * originalAng:Right() * mul
    originalVec = originalVec + newVec.y * originalAng:Forward() * mul
    originalVec = originalVec + newVec.z * originalAng:Up() * mul

    return originalVec, originalAng
end

local bobAmount = 0
function SWEP:RenderBob(pos, ang)
    local ply = self:GetOwner()
    if ( !IsValid(ply) ) then return pos, ang end

    local vel = ply:GetVelocity():Length2D() / 500

    local ft, ct = FrameTime(), CurTime()
    bobAmount = eased(ft * 4, bobAmount, math.Clamp(vel, 0.05, 1))
    
    local eyeAngles = ply:EyeAngles()
    local forward = eyeAngles:Forward()
    local right = eyeAngles:Right()
    local up = eyeAngles:Up()

    local bobX = math.sin(ct * self.Bob.Speed * 1.2345) * bobAmount
    local bobY = math.sin(ct * self.Bob.Speed * 2.8391) * bobAmount
    local bobZ = math.cos(ct * self.Bob.Speed * 4.618) * bobAmount

    local bIron = self:GetIronSights()
    if ( bIron ) then
        bobX = bobX / 2
        bobY = bobY / 2
        bobZ = bobZ / 2

        ang:RotateAroundAxis(right, bobY / 2)
        ang:RotateAroundAxis(up, bobX / 2)

        return pos, ang
    end

    pos = pos + forward * bobX + right * bobY + up * bobZ
    ang:RotateAroundAxis(right, bobY / 2)
    ang:RotateAroundAxis(up, bobX / 2)

    return pos, ang
end

function SWEP:ThinkSway()
    local ft = FrameTime()

    local ply = self:GetOwner()
    local eyeAng = ply:EyeAngles()

    local lastAng = self.Sway.LastAng or eyeAng
    local dist = eyeAng - lastAng
    
    dist.p = -dist.p
    dist.y = -dist.y
    dist.r = -dist.r

    dist = dist * 5.5
    dist = dist * ( self.Sway.Scale or 1 )

    dist.p = -math.Clamp(dist.p, -5, 5)
    dist.y = math.Clamp(dist.y, -5, 5)
    dist.r = math.Clamp(dist.r, -5, 5)
    
    self.Sway.Ang = LerpAngle(ft * 50, self.Sway.Ang or dist, dist)
    self.Sway.LastAng = eyeAng
    self.Sway.BeforeAng = lastAng
end

function SWEP:RenderSway(pos, ang)
	local ft = FrameTime()
    local bIron = self:GetIronSights()
    local swayRaw = self.Sway.Ang or Angle()
	local sway = 0.5 * ( bIron and 0.5 or 1 )

    swayRaw.r = -( swayRaw.y * 0.4 ) * 1.5 * sway

    self.Sway.AngSmooth = LerpAngle(ft * 10, self.Sway.AngSmooth or swayRaw, swayRaw)
    local swayAng = self.Sway.AngSmooth * 2

	local mul = ( self.Sway.PosMul or 1 ) + ( self.Sway.Mul or 1 )
    return translate(
        pos, 
        ang, 
        Vector(swayAng.y * 0.1 * mul, 0, -swayAng.p * 0.1 * mul), 
        swayAng, 
        sway
    )
end

local lerpIron
function SWEP:RenderIronSights(pos, ang)
    if ( !IsValid(self:GetOwner()) ) then return pos, ang end
    if ( !self.IronSightsPos ) then return pos, ang end

    if ( !lerpIron ) then lerpIron = 0 end

    local ft = FrameTime()
    local time = ft / 10

    local bIron = self:GetIronSights()
    if ( bIron ) then
        lerpIron = eased(time, lerpIron, 1)
    else
        lerpIron = eased(time, lerpIron, 0)
    end
    
    local offset = self.IronSightsPos

    if ( self.IronSightsAng ) then
        ang = ang * 1

        ang:RotateAroundAxis(ang:Right(), self.IronSightsAng.x * lerpIron)
        ang:RotateAroundAxis(ang:Up(), self.IronSightsAng.y * lerpIron)
        ang:RotateAroundAxis(ang:Forward(), self.IronSightsAng.z * lerpIron)
    end

    pos = pos + offset.x * ang:Right() * lerpIron
    pos = pos + offset.y * ang:Forward() * lerpIron
    pos = pos + offset.z * ang:Up() * lerpIron

    return pos, ang
end

function SWEP:GetViewModelPosition(pos, ang)
    pos, ang = self:RenderBob(pos, ang)
    pos, ang = self:RenderSway(pos, ang)
    pos, ang = self:RenderIronSights(pos, ang)

    return pos, ang
end

local lerpFOV
function SWEP:TranslateFOV(fov)
    if !lerpFOV then lerpFOV = fov end

    local owner = self:GetOwner()
    if !IsValid(owner) then return fov end

    local ft = FrameTime()
    local time = ft / 100

    local bIron = self:GetIronSights()
    if bIron then
        lerpFOV = eased(time, lerpFOV, self.IronSightsFOV * fov)
    else
        lerpFOV = eased(time, lerpFOV, fov)
    end

    return lerpFOV
end