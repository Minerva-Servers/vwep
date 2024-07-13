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

    local smoothness = self.Sway.AngSmoothness or 10
    self.Sway.AngSmooth = LerpAngle(ft * smoothness, self.Sway.AngSmooth or swayRaw, swayRaw)
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

function SWEP:AdjustMouseSensitivity()
    local bIron = self:GetIronSights()
    if ( bIron ) then
        return self.IronSightsSensitivity or 0.5
    else
        return self.Sensitivity or 1
    end
end

function SWEP:DrawViewModel()
    local ply = self:GetOwner()
    if ( !IsValid(ply) ) then return end

    local vm = ply:GetViewModel()
    if ( !IsValid(vm) ) then return end

    vm:SetMaterial(self.ViewModelMaterial or "")
    vm:SetColor(self.ViewModelColor or Color(255, 255, 255, 255))
    vm:SetRenderMode(self.ViewModelRenderMode or RENDERMODE_NORMAL)
    vm:SetRenderFX(self.ViewModelRenderFX or kRenderFxNone)

    vm:DrawModel()

    if ( self.ViewModelDynamicLights and #self.ViewModelDynamicLights > 0 ) then
        for k, v in ipairs(self.ViewModelDynamicLights) do
            if ( !v.Pos ) then continue end

            local light = DynamicLight(vm:EntIndex() + k)
            if ( !light ) then continue end

            light.Pos = vm:GetPos() + vm:GetAngles():Forward() * v.Pos.x + vm:GetAngles():Right() * v.Pos.y + vm:GetAngles():Up() * v.Pos.z
            light.Brightness = v.Brightness or 1
            light.Size = v.Size or 128
            light.Decay = v.Decay or 100
            light.R = v.R
            light.G = v.G
            light.B = v.B
            light.DieTime = CurTime() + ( v.DieTime or 0.1 )
        end
    end
end

local WorldModel = ClientsideModel(SWEP.WorldModel, SWEP.WorldModelRenderGroup or RENDERGROUP_OTHER)
WorldModel:SetNoDraw(true)

function SWEP:DrawWorldModel()
    local ply = self:GetOwner()
    if ( !IsValid(ply) ) then return end

    local bone = ply:LookupBone(self.WorldModelBone or "ValveBiped.Bip01_R_Hand")
    if ( !bone ) then return end

    local matrix = ply:GetBoneMatrix(bone)
    if ( !matrix ) then return end

    local pos, ang = matrix:GetTranslation(), matrix:GetAngles()
    pos, ang = translate(pos, ang, self.WorldModelOffset or Vector(), self.WorldModelOffsetAng or Angle(), self.WorldModelScale or 1)

    WorldModel:SetModel(self.WorldModel)
    WorldModel:SetPos(pos)
    WorldModel:SetAngles(ang)
    WorldModel:SetupBones()

    WorldModel:SetMaterial(self.WorldModelMaterial or "")
    WorldModel:SetColor(self.WorldModelColor or Color(255, 255, 255, 255))
    WorldModel:SetRenderMode(self.WorldModelRenderMode or RENDERMODE_NORMAL)
    WorldModel:SetRenderFX(self.WorldModelRenderFX or kRenderFxNone)

    WorldModel:DrawModel()

    self.WorldModelEntity = WorldModel

    if ( self.WorldModelDynamicLights and #self.WorldModelDynamicLights > 0 ) then
        for k, v in ipairs(self.WorldModelDynamicLights) do
            if ( !v.Pos ) then continue end

            local light = DynamicLight(self:EntIndex() + k)
            if ( !light ) then continue end

            light.Pos = pos + ang:Forward() * v.Pos.x + ang:Right() * v.Pos.y + ang:Up() * v.Pos.z
            light.Brightness = v.Brightness or 1
            light.Size = v.Size or 128
            light.Decay = v.Decay or 100
            light.R = v.R
            light.G = v.G
            light.B = v.B
            light.DieTime = CurTime() + ( v.DieTime or 0.1 )
        end
    end
end