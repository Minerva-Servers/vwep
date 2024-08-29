include("shared.lua")

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

local lerpIron
function SWEP:RenderIronSights(pos, ang)
    if ( !IsValid(self:GetOwner()) ) then return pos, ang end
    if ( !self.IronSightsPos ) then return pos, ang end

    if ( !lerpIron ) then lerpIron = 0 end

    local ft = FrameTime()
    local time = ft * 4

    local bIron = self:GetIronSights()
    if ( bIron ) then
        lerpIron = Lerp(time, lerpIron, 1)
    else
        lerpIron = Lerp(time, lerpIron, 0)
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
    pos, ang = self:RenderIronSights(pos, ang)

    return pos, ang
end

local lerpFOV
function SWEP:TranslateFOV(fov)
    if !lerpFOV then lerpFOV = fov end

    local owner = self:GetOwner()
    if !IsValid(owner) then return fov end

    local ft = FrameTime()
    local time = ft / 5

    local bIron = self:GetIronSights()
    if bIron then
        lerpFOV = Lerp(time, lerpFOV, self.IronSightsFOV * fov)
    else
        lerpFOV = Lerp(time, lerpFOV, fov)
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

function SWEP:PreDrawViewModel(vm, weapon, ply)
    if ( !IsValid(vm) ) then return end
    if ( !IsValid(weapon) ) then return end
    if ( !IsValid(ply) ) then return end

    vm:SetMaterial(self.ViewModelMaterial or "")
    vm:SetColor(self.ViewModelColor or Color(255, 255, 255, 255))
    vm:SetRenderMode(self.ViewModelRenderMode or RENDERMODE_NORMAL)
    vm:SetRenderFX(self.ViewModelRenderFX or kRenderFxNone)

    if ( self.ViewModelSkin != vm:GetSkin() ) then
        vm:SetSkin(self.ViewModelSkin)
    end

    for k, v in ipairs(self.ViewModelBodygroups or {}) do
        if ( vm:GetBodygroup(k) != v ) then
            vm:SetBodygroup(k, v)
        end
    end

    if ( self.ViewModelDynamicLights and #self.ViewModelDynamicLights > 0 ) then
        for k, v in ipairs(self.ViewModelDynamicLights) do
            if ( !v.Pos ) then continue end

            local light = DynamicLight(vm:EntIndex() + k)
            if ( !light ) then continue end

            local col = v.Color
            col.a = col.a or 255

            light.Pos = vm:GetPos() + vm:GetAngles():Forward() * v.Pos.x + vm:GetAngles():Right() * v.Pos.y + vm:GetAngles():Up() * v.Pos.z
            light.Brightness = v.Brightness or 1
            light.Size = v.Size or 128
            light.Decay = v.Decay or 100
            light.R = col.R
            light.G = col.G
            light.B = col.B
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

    if ( self.PreDrawWorldModel ) then
        self:PreDrawWorldModel()
    end

    local pos, ang = matrix:GetTranslation(), matrix:GetAngles()
    pos, ang = translate(pos, ang, self.WorldModelOffset or Vector(), self.WorldModelOffsetAng or Angle())

    WorldModel:SetModel(self.WorldModel)
    WorldModel:SetPos(pos)
    WorldModel:SetAngles(ang)
    WorldModel:SetupBones()

    WorldModel:SetMaterial(self.WorldModelMaterial or "")
    WorldModel:SetColor(self.WorldModelColor or Color(255, 255, 255, 255))
    WorldModel:SetRenderMode(self.WorldModelRenderMode or RENDERMODE_NORMAL)
    WorldModel:SetRenderFX(self.WorldModelRenderFX or kRenderFxNone)

    WorldModel:SetModelScale(self.WorldModelScale or 1, 0)

    WorldModel:DrawModel()

    if ( self.WorldModelSkin != WorldModel:GetSkin() ) then
        WorldModel:SetSkin(self.WorldModelSkin)
    end

    for k, v in ipairs(self.WorldModelBodygroups or {}) do
        if ( WorldModel:GetBodygroup(k) != v ) then
            WorldModel:SetBodygroup(k, v)
        end
    end

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

    if ( self.PostDrawWorldModel ) then
        self:PostDrawWorldModel()
    end
end

function SWEP:EnabledDevMode()
    local ply = self:GetOwner()
    if ( !IsValid(ply) ) then return false end

    return ply:GetNW2Bool("VWEP.DevMode", false)
end

function SWEP:DrawHUD()
    if ( self.PostDrawHUD ) then
        self:PostDrawHUD()
    end

    if ( self.PastDrawHUD ) then
        self:PastDrawHUD()
    end
end