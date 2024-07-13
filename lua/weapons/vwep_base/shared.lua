// Vanguard Weapon Base, made by Riggs.

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

// Primary sound settings
SWEP.Primary.Sound = Sound("Weapon_Pistol.Single") // Primary fire
SWEP.Primary.SoundLevel = 100 // Sound level, used for sound distance
SWEP.Primary.SoundPitch = 100 // Sound pitch
SWEP.Primary.SoundVolume = 1 // Sound volume
SWEP.Primary.SoundChannel = CHAN_WEAPON // Sound channel

// Iron sights settings
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
SWEP.Reloading.SequenceString = "reload" // The reload animation as a string, this will be prioritized over the sequence
SWEP.Reloading.PlaybackRate = 1 // The playback rate of the reload animation
SWEP.Reloading.Sound = Sound("Weapon_Pistol.Reload") // The reload sound
SWEP.Reloading.SoundLevel = 60 // The reload sound level, used for sound distance
SWEP.Reloading.SoundPitch = 100 // The reload sound pitch
SWEP.Reloading.SoundVolume = 1 // The reload sound volume
SWEP.Reloading.SoundChannel = CHAN_WEAPON // The reload sound channel

// Viewmodel settings
SWEP.ViewModel = "models/weapons/c_pistol.mdl" // The model used in first-person view
SWEP.ViewModelFOV = 62 // Viewmodel field of view
SWEP.ViewModelFlip = false // Flip the viewmodel
SWEP.ViewModelOffset = Vector(0, 0, 0) // Viewmodel offset
SWEP.ViewModelOffsetAng = Angle(0, 0, 0) // Viewmodel angle offset
SWEP.ViewModelScale = 1 // Viewmodel scale
SWEP.ViewModelDynamicLights = {
    {Pos = Vector(0, 0, 0), Brightness = 1, Size = 1, Decay = 100, R = 255, G = 255, B = 255} // Example
}

SWEP.ViewModelMaterial = "" // Viewmodel material
SWEP.ViewModelColor = Color(255, 255, 255, 255) // Viewmodel color
SWEP.ViewModelRenderMode = RENDERMODE_NORMAL // Viewmodel render mode
SWEP.ViewModelRenderFX = kRenderFxNone // Viewmodel render fx

// Worldmodel settings
SWEP.WorldModel = "models/weapons/w_pistol.mdl" // The model used in third-person view
SWEP.WorldModelBone = "ValveBiped.Bip01_R_Hand" // The bone to attach the worldmodel to
SWEP.WorldModelOffset = Vector(0, 0, 0) // Worldmodel offset
SWEP.WorldModelOffsetAng = Angle(0, 0, 0) // Worldmodel angle offset
SWEP.WorldModelScale = 1 // Worldmodel scale
SWEP.WorldModelDynamicLights = {
    {Pos = Vector(0, 0, 0), Brightness = 1, Size = 1, Decay = 100, R = 255, G = 255, B = 255} // Example
}

SWEP.WorldModelMaterial = "" // Worldmodel material
SWEP.WorldModelColor = Color(255, 255, 255, 255) // Worldmodel color
SWEP.WorldModelRenderMode = RENDERMODE_NORMAL // Worldmodel render mode
SWEP.WorldModelRenderFX = kRenderFxNone // Worldmodel render fx

// Recoil settings
SWEP.Recoil = {}
SWEP.Recoil.Punch = Angle(1, 0, 0) // Punch angle

// Disable the default gmod weapon sway and bob
SWEP.SwayScale = 0
SWEP.BobScale = 0

// Bob settings
SWEP.Bob = {}
SWEP.Bob.Scale = 1
SWEP.Bob.Speed = 1

// Sway settings
SWEP.Sway = {}
SWEP.Sway.Scale = 1
SWEP.Sway.Speed = 1

function SWEP:SetupDataTables()
    self:NetworkVar("Bool", 0, "IronSights")
    self:NetworkVar("Bool", 1, "Reloading")
    self:NetworkVar("Bool", 2, "Lowered")
end

function SWEP:Initialize()
    self:SetWeaponHoldType(self.HoldType) // Set the weapon hold type
    self:SetIronSights(false)
end

function SWEP:CalculateNextPrimaryFire()
    if ( self.Primary.RPM ) then
        return CurTime() + ( 60 / self.Primary.RPM )
    end

    return CurTime() + self.Primary.Delay
end

function SWEP:PrimaryAttack()
    if ( !IsFirstTimePredicted() ) then return end
    if ( !self:CanPrimaryAttack() ) then return end

    self:ShootBullet(self.Primary.Damage, self.Primary.NumShots, self.Primary.Cone)

    self:EmitSound(self.Primary.Sound, self.Primary.SoundLevel or 100, self.Primary.SoundPitch or 100, self.Primary.SoundVolume or 1, self.Primary.SoundChannel or CHAN_WEAPON)
    self:TakePrimaryAmmo(1)

    local ply = self:GetOwner()
    ply:SetEyeAngles(ply:EyeAngles() + Angle(-self.Primary.Recoil, 0, 0))
    ply:ViewPunch(self.Recoil.Punch or Angle(-self.Primary.Recoil, 0, 0))

    self:SetNextPrimaryFire(self:CalculateNextPrimaryFire())
end

function SWEP:CanIronSight()
    local ply = self:GetOwner()
    if ( !IsValid(ply) ) then return false end

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
    if ( !self:CanIronSight() ) then return end

    self:SetIronSights(!self:GetIronSights())
    self:SetNextSecondaryFire(CurTime() + self.IronSightsDelay)
end

function SWEP:ShootBullet(damage, num_bullets, aimcone)
    local bullet = {}
    bullet.Num = num_bullets
    bullet.Src = self:GetOwner():GetShootPos()
    bullet.Dir = self:GetOwner():GetAimVector()
    bullet.Spread = Vector(aimcone, aimcone, 0)
    bullet.Tracer = 1
    bullet.TracerName = "Tracer"
    bullet.Force = damage * 0.5
    bullet.Damage = damage
    bullet.Attacker = self:GetOwner()

    self:GetOwner():FireBullets(bullet)
    self:ShootEffects()
end

function SWEP:ShootEffects()
    local ply = self:GetOwner()
    if ( !IsValid(ply) ) then return end

    self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
    ply:MuzzleFlash()
    ply:SetAnimation(PLAYER_ATTACK1)
end

function SWEP:CanPrimaryAttack()
    if ( self:Clip1() <= 0 ) then
        self:EmitSound("Weapon_Pistol.Empty")
        self:SetNextPrimaryFire(CurTime() + 0.2)
        return false
    end

    return self:GetNextPrimaryFire() <= CurTime()
end

function SWEP:CanReload()
    local ply = self:GetOwner()
    if ( !IsValid(ply) ) then return false end

    if ( self:GetReloading() ) then return false end

    return self:Clip1() < self.Primary.ClipSize and self:GetOwner():GetAmmoCount(self.Primary.Ammo) > 0
end

function SWEP:GetViewModelReloadAnimation()
    local reloadSequence = self.Reloading.Sequence
    if ( isfunction(reloadSequence) ) then
        reloadSequence = reloadSequence(self)
    elseif ( istable(reloadSequence) ) then
        reloadSequence = reloadSequence[math.random(#reloadSequence)]
    end

    return self.Reloading.SequenceString or self.Reloading.Sequence or ACT_VM_RELOAD
end

function SWEP:Reload()
    if ( !IsFirstTimePredicted() ) then return end
    if ( !self:CanReload() ) then return end

    local ply = self:GetOwner()
    if ( !IsValid(ply) ) then return end

    self:SetIronSights(false)
    self:SetReloading(true)

    ply:SetAnimation(PLAYER_RELOAD)

    local vmReload = self:GetViewModelReloadAnimation()
    local vm = ply:GetViewModel()
    vm:SendViewModelMatchingSequence(isstring(vmReload) and vm:LookupSequence(vmReload) or vmReload)

    local duration = vm:SequenceDuration() / vm:GetPlaybackRate()
    self:SetNextPrimaryFire(CurTime() + duration)

    self:EmitSound(self.Reloading.Sound, self.Reloading.SoundLevel or 60, self.Reloading.SoundPitch or 100, self.Reloading.SoundVolume or 1, self.Reloading.SoundChannel or CHAN_WEAPON)

    timer.Simple(duration, function()
        if ( !IsValid(self) ) then return end

        self:SetReloading(false)
        self:SetClip1(self.Primary.ClipSize)
    end)
end

function SWEP:Think()
    local ply = self:GetOwner()
    if ( !IsValid(ply) ) then return end

    if ( self:GetIronSights() and !self:CanIronSight() ) then
        self:SetIronSights(false)
    elseif ( self:GetIronSights() and !self.IronSightsToggle and !ply:KeyDown(IN_ATTACK2) ) then
        self:SetIronSights(false)
    end

    if ( CLIENT ) then
        self:ThinkSway()
    end
end