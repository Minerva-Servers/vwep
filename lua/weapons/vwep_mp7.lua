AddCSLuaFile()

SWEP.Base = "vwep_base" // Base

// Information
SWEP.PrintName = "MP7 Submachine Gun" // Weapon name in the HUD
SWEP.Author = "Riggs" // Author
SWEP.Instructions = "Left click to shoot, right click to zoom." // Instructions
SWEP.Category = "Vanguard" // Category in the spawn menu

// Weapon settings
SWEP.Slot = 2 // Slot in the weapon selection menu
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
SWEP.HoldType = "smg" // Weapon hold type
SWEP.UseHands = true // Use hands model
SWEP.Sensitivity = 1 // Sensitivity when not aiming

// Primary gun settings
SWEP.Primary.ClipSize = 45 // Size of a clip
SWEP.Primary.DefaultClip = 45 // Default number of bullets in a clip
SWEP.Primary.Automatic = true // Is this weapon automatic
SWEP.Primary.Ammo = "SMG1" // Type of ammo

// Primary fire settings
SWEP.Primary.Recoil = 0.4 // Recoil effect
SWEP.Primary.Damage = 10 // Damage per shot
SWEP.Primary.NumShots = 1 // Number of shots per trigger pull
SWEP.Primary.Cone = 0.06 // Bullet spread
SWEP.Primary.Delay = 0.5 // Delay between shots
SWEP.Primary.RPM = 800 // Rounds per minute, this is used instead of delay if it's set

// Primary sound settings
SWEP.Primary.Sound = Sound("Weapon_SMG1.Single") // Primary fire 
SWEP.Primary.SoundLevel = 100 // Sound level, used for sound distance
SWEP.Primary.SoundPitch = 100 // Sound pitch
SWEP.Primary.SoundVolume = 1 // Sound volume
SWEP.Primary.SoundChannel = CHAN_WEAPON // Sound channel

// Iron sights settings
SWEP.IronSightsPos = Vector(-6.401, -2.221, 1.029) // Iron sights position
SWEP.IronSightsAng = Vector(0, 0, 0) // Iron sights angle
SWEP.IronSightsFOV = 0.75 // Iron sights field of view
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
SWEP.Reloading.Sound = Sound("Weapon_SMG1.Reload") // The reload sound
SWEP.Reloading.SoundLevel = 60 // The reload sound level, used for sound distance
SWEP.Reloading.SoundPitch = 100 // The reload sound pitch
SWEP.Reloading.SoundVolume = 1 // The reload sound volume
SWEP.Reloading.SoundChannel = CHAN_WEAPON // The reload sound channel

// Viewmodel settings
SWEP.ViewModel = "models/weapons/c_smg1.mdl" // The model used in first-person view
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
SWEP.WorldModel = "models/weapons/w_smg1.mdl" // The model used in third-person view
SWEP.WorldModelBone = "ValveBiped.Bip01_R_Hand" // The bone to attach the worldmodel to, this is required!
SWEP.WorldModelOffset = Vector(0, 10, 4) // Worldmodel offset
SWEP.WorldModelOffsetAng = Angle(0, 0, 180) // Worldmodel angle offset
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
SWEP.Recoil.Punch = Angle(0.25, 0, 0) // Punch angle

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