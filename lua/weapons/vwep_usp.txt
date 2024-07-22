AddCSLuaFile()

SWEP.Base = "vwep_base" // Base

// Information
SWEP.PrintName = "USP Match Pistol" // Weapon name in the HUD
SWEP.Author = "Riggs" // Author
SWEP.Instructions = "Left click to shoot, right click to zoom." // Instructions
SWEP.Category = "Vanguard" // Category in the spawn menu

// Weapon settings
SWEP.Slot = 1 // Slot in the weapon selection menu
SWEP.SlotPos = 1 // Slot position
SWEP.DrawAmmo = true // Draw the ammo count
SWEP.DrawCrosshair = true // Draw the crosshair
SWEP.DrawWeaponInfoBox = false // Draw the weapon info box

// Base weapon settings
SWEP.Spawnable = true // Can be spawned via the Q menu
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
SWEP.Primary.SoundEmpty = Sound("Weapon_Pistol.Empty") // Primary fire when empty
SWEP.Primary.SoundLevel = 100 // Sound level, used for sound distance
SWEP.Primary.SoundPitch = 100 // Sound pitch
SWEP.Primary.SoundVolume = 1 // Sound volume
SWEP.Primary.SoundChannel = CHAN_WEAPON // Sound channel

// Iron sights settings
SWEP.IronSightsEnabled = true // Enable iron sights
SWEP.IronSightsPos = Vector(-6.035, 0, 3.029) // Iron sights position
SWEP.IronSightsAng = Vector(0.2, -1.3, 1) // Iron sights angle
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
    --{Pos = Vector(0, 0, 0), Brightness = 1, Size = 128, Decay = 100, R = 255, G = 255, B = 255, DieTime = 0.1} // Example
}

SWEP.ViewModelMaterial = "" // Viewmodel material
SWEP.ViewModelColor = Color(255, 255, 255, 255) // Viewmodel color
SWEP.ViewModelRenderMode = RENDERMODE_NORMAL // Viewmodel render mode
SWEP.ViewModelRenderFX = kRenderFxNone // Viewmodel render fx

// Worldmodel settings
SWEP.WorldModel = "models/weapons/w_pistol.mdl" // The model used in third-person view
SWEP.WorldModelSkin = 0 // Worldmodel skin
SWEP.WorldModelBodygroups = {} // Worldmodel bodygroups
SWEP.WorldModelBone = "ValveBiped.Bip01_R_Hand" // The bone to attach the worldmodel to, this is required!
SWEP.WorldModelOffset = Vector(1.5, -5, 3.5) // Worldmodel offset
SWEP.WorldModelOffsetAng = Angle(0, 180, 180) // Worldmodel angle offset
SWEP.WorldModelScale = 1 // Worldmodel scale
SWEP.WorldModelDynamicLights = {
    --{Pos = Vector(0, 0, 0), Brightness = 1, Size = 128, Decay = 100, R = 255, G = 255, B = 255, DieTime = 0.1} // Example
}

SWEP.WorldModelMaterial = "" // Worldmodel material
SWEP.WorldModelColor = Color(255, 255, 255, 255) // Worldmodel color
SWEP.WorldModelRenderMode = RENDERMODE_NORMAL // Worldmodel render mode
SWEP.WorldModelRenderFX = kRenderFxNone // Worldmodel render fx

// Recoil settings
SWEP.Recoil = {}
SWEP.Recoil.Punch = nil // Punch angle