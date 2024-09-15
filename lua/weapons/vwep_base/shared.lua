// Information
SWEP.PrintName = "Vanguard Weapon Base" // Weapon name in the HUD
SWEP.Author = "Riggs" // Author
SWEP.Instructions = "Left click to shoot, right click to zoom." // Instructions
SWEP.Category = "Vanguard" // Category in the spawn menu
SWEP.IsVWEP = true // Mark this as a Vanguard Weapon Base Weapon, useful for other scripts

// Weapon settings
SWEP.Slot = 1 // Slot in the weapon selection menu
SWEP.SlotPos = 1 // Slot position
SWEP.DrawAmmo = true // Draw the ammo count
SWEP.DrawCrosshair = true // Draw the crosshair
SWEP.DrawWeaponInfoBox = false // Draw the weapon info box

// Base weapon settings
SWEP.Spawnable = false // Can be spawned via the Q menu
SWEP.AdminOnly = false // Admin only spawn

// Secondary gun settings, unused for now
SWEP.Secondary.ClipSize = -1 // No secondary clip
SWEP.Secondary.DefaultClip = -1 // No secondary default clip
SWEP.Secondary.Automatic = false // Secondary fire automatic?
SWEP.Secondary.Ammo = "none" // No secondary ammo

// Weapon settings
SWEP.HoldType = "pistol" // Weapon hold type
SWEP.UseHands = true // Use hands model
SWEP.Sensitivity = 1 // Sensitivity when not aiming

// Primary gun settings
SWEP.Primary.ClipSize = 18 // Size of a clip
SWEP.Primary.DefaultClip = 18 // Default number of bullets in a clip
SWEP.Primary.Automatic = false // Is this weapon automatic
SWEP.Primary.Ammo = "Pistol" // Type of ammo

// Primary fire settings
SWEP.Primary.Recoil = 1 // Recoil effect
SWEP.Primary.Damage = 10 // Damage per shot
SWEP.Primary.NumShots = 1 // Number of shots per trigger pull
SWEP.Primary.Cone = 0.02 // Bullet spread
SWEP.Primary.Delay = 0.5 // Delay between shots
SWEP.Primary.RPM = 400 // Rounds per minute, this is used instead of delay if it's set
SWEP.Primary.Sequence = ACT_VM_PRIMARYATTACK // The shoot animation
SWEP.Primary.SequenceIronSights = ACT_VM_PRIMARYATTACK // The shoot animation when iron sighting
SWEP.Primary.PlaybackRate = 1 // The playback rate of the shoot animation

// Primary sound settings
SWEP.Primary.Sound = Sound("Weapon_Pistol.Single") // Primary fire
SWEP.Primary.SoundEmpty = Sound("Weapon_Pistol.Empty") // Primary fire when empty
SWEP.Primary.SoundLevel = 100 // Sound level, used for sound distance
SWEP.Primary.SoundPitch = 100 // Sound pitch
SWEP.Primary.SoundVolume = 1 // Sound volume
SWEP.Primary.SoundChannel = CHAN_WEAPON // Sound channel

// Iron sights settings
SWEP.IronSightsEnabled = true // Enable iron sights
SWEP.IronSightsPos = Vector(-5.95, -9.2, 2.7) // Iron sights position
SWEP.IronSightsAng = Vector(2.6, 1.37, 3.5) // Iron sights angle
SWEP.IronSightsFOV = 0.75 // Iron sights field of view
SWEP.IronSightsSensitivity = 0.5 // Iron sights sensitivity
SWEP.IronSightsCanMove = true // Can the player iron sight while moving?
SWEP.IronSightsCanMoveRun = false // Can the player iron sight while running?
SWEP.IronSightsDelay = 0.25 // Delay between iron sights toggling
SWEP.IronSightsRunSpeed = 0.75 // Check if the player is marked as running at this speed
SWEP.IronSightsToggle = false // Is the iron sight a toggle mechanism, mark as false if it's a hold mechanism

// Reloading settings
SWEP.Reloading = {}
SWEP.Reloading.Sequence = ACT_VM_RELOAD // The reload animation
SWEP.Reloading.SequenceIronSights = ACT_VM_RELOAD // The reload animation when iron sighting
SWEP.Reloading.PlaybackRate = 1 // The playback rate of the reload animation
SWEP.Reloading.Sound = Sound("Weapon_Pistol.Reload") // The reload sound
SWEP.Reloading.SoundLevel = 60 // The reload sound level, used for sound distance
SWEP.Reloading.SoundPitch = 100 // The reload sound pitch
SWEP.Reloading.SoundVolume = 1 // The reload sound volume
SWEP.Reloading.SoundChannel = CHAN_WEAPON // The reload sound channel

// Cycling settings
SWEP.Cycling = {}
SWEP.Cycling.Enabled = false // Enable cycling
SWEP.Cycling.Sequence = ACT_VM_RELOAD // The cycling animation
SWEP.Cycling.SequenceIronSights = ACT_VM_RELOAD // The cycling animation when iron sighting
SWEP.Cycling.PlaybackRate = 1 // The playback rate of the cycling animation
SWEP.Cycling.Sound = Sound("Weapon_Pistol.Reload") // The cycling sound
SWEP.Cycling.SoundLevel = 60 // The cycling sound level, used for sound distance
SWEP.Cycling.SoundPitch = 100 // The cycling sound pitch
SWEP.Cycling.SoundVolume = 1 // The cycling sound volume
SWEP.Cycling.SoundChannel = CHAN_WEAPON // The cycling sound channel
SWEP.Cycling.Delay = 0.5 // The delay between cycling
SWEP.Cycling.Automatic = false // Is the cycling automatic?

// Pump action settings
SWEP.PumpAction = {}
SWEP.PumpAction.Enabled = false // Enable pump action
SWEP.PumpAction.Sequence = ACT_SHOTGUN_PUMP // The pump action animation
SWEP.PumpAction.SequenceIronSights = ACT_SHOTGUN_PUMP // The pump action animation when iron sighting
SWEP.PumpAction.PlaybackRate = 1 // The playback rate of the pump action animation
SWEP.PumpAction.Sound = Sound("Weapon_Shotgun.Special1") // The pump action sound
SWEP.PumpAction.SoundLevel = 60 // The pump action sound level, used for sound distance
SWEP.PumpAction.SoundPitch = 100 // The pump action sound pitch
SWEP.PumpAction.SoundVolume = 1 // The pump action sound volume
SWEP.PumpAction.SoundChannel = CHAN_WEAPON // The pump action sound channel

// Viewmodel settings
SWEP.ViewModel = "models/weapons/c_pistol.mdl" // The model used in first-person view
SWEP.ViewModelSkin = 0 // Viewmodel skin
SWEP.ViewModelBodygroups = {} // Viewmodel bodygroups
SWEP.ViewModelFOV = 62 // Viewmodel field of view
SWEP.ViewModelFlip = false // Flip the viewmodel
SWEP.ViewModelOffset = Vector(0, 0, 0) // Viewmodel offset
SWEP.ViewModelOffsetAng = Angle(0, 0, 0) // Viewmodel angle offset
SWEP.ViewModelScale = 1 // Viewmodel scale
SWEP.ViewModelDynamicLights = {
    --{Pos = Vector(0, 0, 0), Brightness = 1, Size = 1, Decay = 100, Color = Color(255, 255, 255, 255)} // Example
}

SWEP.ViewModelMaterial = "" // Viewmodel material
SWEP.ViewModelColor = Color(255, 255, 255, 255) // Viewmodel color
SWEP.ViewModelRenderMode = RENDERMODE_NORMAL // Viewmodel render mode
SWEP.ViewModelRenderFX = kRenderFxNone // Viewmodel render fx

// Worldmodel settings
SWEP.WorldModel = "models/weapons/w_pistol.mdl" // The model used in third-person view
SWEP.WorldModelSkin = 0 // Worldmodel skin
SWEP.WorldModelBodygroups = {} // Worldmodel bodygroups
SWEP.WorldModelBone = "ValveBiped.Bip01_R_Hand" // The bone to attach the worldmodel to
SWEP.WorldModelOffset = Vector(0, 0, 0) // Worldmodel offset
SWEP.WorldModelOffsetAng = Angle(0, 0, 0) // Worldmodel angle offset
SWEP.WorldModelScale = 1 // Worldmodel scale
SWEP.WorldModelDynamicLights = {
    --{Pos = Vector(0, 0, 0), Brightness = 1, Size = 1, Decay = 100, Color = Color(255, 255, 255)} // Example
}

SWEP.WorldModelMaterial = "" // Worldmodel material
SWEP.WorldModelColor = Color(255, 255, 255, 255) // Worldmodel color
SWEP.WorldModelRenderMode = RENDERMODE_NORMAL // Worldmodel render mode
SWEP.WorldModelRenderFX = kRenderFxNone // Worldmodel render fx

// Weapon effects
SWEP.Effects = {}
SWEP.Effects.MuzzleFlash = true // Enable muzzle flash
SWEP.Effects.MuzzleFlashEffect = "MuzzleFlash" // Muzzle flash effect
SWEP.Effects.MuzzleFlashFlags = 1 // Muzzle flash flags
SWEP.Effects.MuzzleFlashScale = 1 // Muzzle flash scale
SWEP.Effects.MuzzleFlashAttachment = "muzzle" // Muzzle flash attachment

SWEP.Effects.Tracer = true // Enable tracer
SWEP.Effects.TracerEffect = "Tracer" // Tracer effect
SWEP.Effects.TracerScale = 1 // Tracer scale
SWEP.Effects.TracerAttachment = "muzzle" // Tracer attachment

function SWEP:SetupDataTables()
    if ( self.PreSetupDataTables ) then
        self:PreSetupDataTables()
    end

    self:NetworkVar("Bool", 0, "IronSights")
    self:NetworkVar("Bool", 1, "Reloading")
    self:NetworkVar("Float", 0, "NextIdle")

    if ( self.PostSetupDataTables ) then
        self:PostSetupDataTables()
    end
end

function SWEP:Initialize()
    if ( self.PreInitialize ) then
        self:PreInitialize()
    end

    self:SetWeaponHoldType(self.HoldType)
    self:SetIronSights(false)

    if ( self.PostInitialize ) then
        self:PostInitialize()
    end
end

function SWEP:PlayAnimation(anim, rate)
    local vm = self:GetOwner():GetViewModel()
    if ( !IsValid(vm) ) then return end

    local sequence = isstring(anim) and vm:LookupSequence(anim) or anim
    if ( sequence == -1 ) then return end

    vm:SendViewModelMatchingSequence(sequence)
    vm:SetPlaybackRate(rate or 1)

    return sequence, vm:SequenceDuration(sequence) / vm:GetPlaybackRate()
end

function SWEP:QueueIdle(duration)
    local vm = self:GetOwner():GetViewModel()
    if ( !IsValid(vm) ) then return end

    duration = duration or vm:SequenceDuration() / vm:GetPlaybackRate()
    duration = math.Round(duration, 2)
    duration = duration + 0.1

    self:SetNextIdle(CurTime() + duration)
end

function SWEP:CalculateNextPrimaryFire()
    if ( self.Primary.RPM ) then
        return CurTime() + ( 60 / self.Primary.RPM )
    end

    return CurTime() + self.Primary.Delay
end

function SWEP:PrimaryAttack()
    if ( !self:CanPrimaryAttack() ) then return end

    if ( self.PrePrimaryAttack ) then
        self:PrePrimaryAttack()
    end

    if ( self:Clip1() <= 0 ) then
        self:EmitSound(self.Primary.SoundEmpty, 60, 100, 1, CHAN_WEAPON)
        self:SetNextPrimaryFire(CurTime() + 0.2)
        return
    end

    self:ShootBullet(self.Primary.Damage, self.Primary.NumShots, self.Primary.Cone)

    self:EmitSound(self.Primary.Sound, self.Primary.SoundLevel or 100, self.Primary.SoundPitch or 100, self.Primary.SoundVolume or 1, self.Primary.SoundChannel or CHAN_WEAPON)
    self:TakePrimaryAmmo(1)

    local ply = self:GetOwner()
    if ( IsValid(ply) ) then
        local recoilAngle = Angle(-1, math.Rand(-1, 1), 0)

        if ( self:GetIronSights() ) then
            recoilAngle = recoilAngle * ( self.Primary.RecoilIronSights or self.Primary.Recoil )
        else
            recoilAngle = recoilAngle * self.Primary.Recoil
        end

        ply:SetEyeAngles(ply:EyeAngles() + recoilAngle * 0.75)
        ply:ViewPunch(recoilAngle * 0.5)
    end

    self:SetNextPrimaryFire(self:CalculateNextPrimaryFire())

    if ( self.PostPrimaryAttack ) then
        self:PostPrimaryAttack()
    end
end

function SWEP:CanIronSight()
    local ply = self:GetOwner()
    if ( !IsValid(ply) ) then return false end

    if ( !self.IronSightsEnabled ) then return false end
    if ( self:GetReloading() ) then return false end
    if ( ply:KeyDown(IN_USE) ) then return false end

    if ( self.IronSightsCanMove ) then
        local runSpeed = ply:GetRunSpeed()
        local vel = ply:GetVelocity():Length2D() / runSpeed
        vel = math.Round(vel, 2)
        vel = math.Clamp(vel, 0, 1)

        if ( vel > self.IronSightsRunSpeed ) then
            return self.IronSightsCanMoveRun and true or false
        end
    end

    return true
end

function SWEP:SecondaryAttack()
    if ( !IsFirstTimePredicted() ) then return end
    if ( !self:CanSecondaryAttack() ) then return end

    if ( self.PreSecondaryAttack ) then
        self:PreSecondaryAttack()
    end

    self:SetNextSecondaryFire(CurTime() + self.IronSightsDelay)

    if ( self.PostSecondaryAttack ) then
        self:PostSecondaryAttack()
    end
end

function SWEP:ShootBullet(damage, num_bullets, aimcone)
    if ( self.PreShootBullet ) then
        self:PreShootBullet(damage, num_bullets, aimcone)
    end

    local bullet = {}
    bullet.Num = num_bullets
    bullet.Src = self:GetOwner():GetShootPos()
    bullet.Dir = self:GetOwner():GetAimVector()
    bullet.Spread = Vector(aimcone, aimcone, aimcone)
    bullet.Tracer = 1
    bullet.TracerName = self.Effects.TracerEffect
    bullet.Force = damage * 0.5
    bullet.Damage = damage
    bullet.Attacker = self:GetOwner()

    self:GetOwner():FireBullets(bullet)
    self:ShootEffects()

    if ( self.PostShootBullet ) then
        self:PostShootBullet(damage, num_bullets, aimcone, bullet)
    end
end

function SWEP:GetViewModelShootAnimation()
    local shootSequence = self.Primary.Sequence or ACT_VM_PRIMARYATTACK
    if ( self:GetIronSights() ) then
        shootSequence = self.Primary.SequenceIronSights or shootSequence
    end

    if ( isfunction(shootSequence) ) then
        shootSequence = shootSequence(self)
    elseif ( istable(shootSequence) ) then
        shootSequence = shootSequence[math.random(#shootSequence)]
    end

    return shootSequence
end

function SWEP:GetShootGesture()
    local gesture = self.Primary.Gesture or ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
    if ( self:GetIronSights() ) then
        gesture = self.Primary.GestureIronSights
    end

    if ( isfunction(gesture) ) then
        gesture = gesture(self)
    elseif ( istable(gesture) ) then
        gesture = gesture[math.random(#gesture)]
    end

    return gesture
end

function SWEP:ShootEffects()
    if ( self.PreShootEffects ) then
        self:PreShootEffects()
    end

    local ply = self:GetOwner()
    if ( !IsValid(ply) ) then return end

    self:PlayAnimation(self:GetViewModelShootAnimation(), self.Primary.PlaybackRate)
    self:QueueIdle()

    if ( CLIENT ) then
        local ent = self:GetOwner():GetViewModel()
        if ( self:GetOwner():ShouldDrawLocalPlayer() ) then
            ent = self.WorldModelEntity
        end

        if ( IsValid(ent) ) then
            local effectData = EffectData()
            effectData:SetEntity(ent)
            effectData:SetAttachment(ent:LookupAttachment(self.Effects.MuzzleFlashAttachment or "muzzle"))
            effectData:SetScale(self.Effects.MuzzleFlashScale or 1)
            effectData:SetFlags(self.Effects.MuzzleFlashFlags or 1)
            util.Effect(self.Effects.MuzzleFlashEffect, effectData)
        end
    end

    ply:SetAnimation(PLAYER_ATTACK1)

    if ( self.PostShootEffects ) then
        self:PostShootEffects()
    end
end

function SWEP:CanPrimaryAttack()
    if ( self:GetReloading() ) then return false end

    return self:GetNextPrimaryFire() <= CurTime()
end

function SWEP:CanSecondaryAttack()
    if ( !self.IronSightsEnabled ) then return false end
    if ( self:GetReloading() ) then return false end

    return self:GetNextSecondaryFire() <= CurTime()
end

function SWEP:CanReload()
    local ply = self:GetOwner()
    if ( !IsValid(ply) ) then return false end

    if ( self:GetReloading() ) then return false end

    return self:Clip1() < self.Primary.ClipSize and self:GetOwner():GetAmmoCount(self.Primary.Ammo) > 0
end

function SWEP:GetViewModelReloadAnimation(bIronsighted)
    local clip = self:Clip1()
    local reloadSequence = self.Reloading.Sequence or ACT_VM_RELOAD

    if ( bIronsighted ) then
        if ( clip <= 0 ) then
            reloadSequence = self.Reloading.SequenceIronSightsEmpty or reloadSequence
        else
            reloadSequence = self.Reloading.SequenceIronSights or reloadSequence
        end
    else
        if ( clip <= 0 ) then
            reloadSequence = self.Reloading.SequenceEmpty or reloadSequence
        end
    end

    if ( isfunction(reloadSequence) ) then
        reloadSequence = reloadSequence(self)
    elseif ( istable(reloadSequence) ) then
        reloadSequence = reloadSequence[math.random(#reloadSequence)]
    end

    return reloadSequence
end

function SWEP:Reload()
    if ( !IsFirstTimePredicted() ) then return end
    if ( !self:CanReload() ) then return end

    local ply = self:GetOwner()
    if ( !IsValid(ply) ) then return end

    if ( self.PreReload ) then
        self:PreReload()
    end

    local bIronsighted = self:GetIronSights()
    self:SetIronSights(false)
    self:SetReloading(true)

    ply:SetAnimation(PLAYER_RELOAD)

    local vmReload = self:GetViewModelReloadAnimation(bIronsighted)
    local vm = ply:GetViewModel()
    local _, duration = self:PlayAnimation(vmReload, self.Reloading.PlaybackRate)
    self:QueueIdle()

    self:SetNextPrimaryFire(CurTime() + duration)

    local reloadSound, reloadSoundLevel, reloadSoundPitch, reloadSoundVolume, reloadSoundChannel = self.Reloading.Sound, self.Reloading.SoundLevel, self.Reloading.SoundPitch, self.Reloading.SoundVolume, self.Reloading.SoundChannel
    self:EmitSound(reloadSound, reloadSoundLevel or 60, reloadSoundPitch or 100, reloadSoundVolume or 1, reloadSoundChannel or CHAN_WEAPON)

    timer.Simple(duration, function()
        if ( !IsValid(self) ) then return end

        if ( self.PreReloadFinish ) then
            self:PreReloadFinish()
        end

        self:SetReloading(false)

        local ammo = self.Primary.ClipSize - self:Clip1()
        local ammoToTake = math.min(ammo, ply:GetAmmoCount(self.Primary.Ammo))
        ply:RemoveAmmo(ammoToTake, self.Primary.Ammo)
        self:SetClip1(self:Clip1() + ammoToTake)

        if ( self.PostReloadFinish ) then
            self:PostReloadFinish()
        end
    end)

    if ( self.PostReload ) then
        self:PostReload()
    end
end

function SWEP:ThinkIronSights()
    local ply = self:GetOwner()
    if ( self:GetIronSights() and !self:CanIronSight() ) then
        self:SetIronSights(false)
        return
    end

    if ( IsFirstTimePredicted() ) then
        if ( self:GetIronSights() and !ply:KeyDown(IN_ATTACK2) ) then
            self:SetIronSights(false)
        elseif ( !self:GetIronSights() and ply:KeyDown(IN_ATTACK2) and self:CanIronSight() ) then
            self:SetIronSights(true)
        end
    end
end

function SWEP:ThinkIdle()
    if ( !self:GetNextIdle() ) then
        self:SetNextIdle(0)
    end

    if ( self:GetNextIdle() <= 0 ) then return end

    if ( CurTime() > self:GetNextIdle() ) then
        self:SetNextIdle(0)
        self:PlayAnimation(self:Clip1() > 0 and ( self.IdleAnim or ACT_VM_IDLE ) or ( self.EmptyAnim or ACT_VM_IDLE_EMPTY ))
    end
end

function SWEP:Think()
    local ply = self:GetOwner()
    if ( !IsValid(ply) ) then return end

    self:ThinkIronSights()
    self:ThinkIdle()
end

function SWEP:Deploy()
    if ( self.PreDeploy ) then
        self:PreDeploy()
    end

    self:SetIronSights(false)
    self:SetReloading(false)
    self:SetNextIdle(0)

    self:PlayAnimation(self.DeployAnim or ACT_VM_DRAW)
    self:QueueIdle()

    if ( self.PostDeploy ) then
        self:PostDeploy()
    end

    return true
end

function SWEP:Holster()
    if ( self.PreHolster ) then
        self:PreHolster()
    end

    self:SetIronSights(false)
    self:SetReloading(false)
    self:SetNextIdle(0)

    if ( self.PostHolster ) then
        self:PostHolster()
    end

    return true
end