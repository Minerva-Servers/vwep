# Vanguard Weapon Base (VWEP)

Welcome to the Vanguard Weapon Base (VWEP) for Garry's Mod, the base is designed to be simple for any newcomers or experienced developers. It'll provide a small and stable foundation for any new projects that you might have, in the brighter future I'll plan to add a lot more to this weapon base such as attachments.

## Features

- **User-Friendly**: VWEP is designed with simplicity in mind, making it easy for both new and experienced developers to create custom weapons.
- **Flexible**: Easily customizable with various settings to suit your needs.
- **Comprehensive**: Includes settings for recoil, iron sights, sounds, and more in the future.

## Installation

1. **Download the VWEP base**: Place the `vwep` folder in your `addons` directory within Garry's Mod.
2. **Create a new weapon**: Use the provided template below to create your own weapon file.

## Additional Console Commands

- **vwep_print_ammonames**: Prints all Ammo Types registered on the server, useful for SWEP.Primary.Ammo
Example Output:
```lua
[VWEP] Ammo - AR2
[VWEP] Ammo - AR2AltFire
[VWEP] Ammo - Pistol
[VWEP] Ammo - SMG1
[VWEP] Ammo - 357
```

## Example Weapon: USP Match Pistol

Here’s an example of a weapon script using the Vanguard Weapon Base. Save this as `vwep_usp.lua` in your `lua/weapons/` directory, or if you are running this for a gamemode, put the weapon within the `*your gamemode*/entities/weapons/` directory.

```lua
AddCSLuaFile()

SWEP.Base = "vwep_base" -- Base

-- Information
SWEP.PrintName = "USP Match Pistol" -- Weapon name in the HUD
SWEP.Author = "Riggs" -- Author
SWEP.Instructions = "Left click to shoot, right click to zoom." -- Instructions
SWEP.Category = "Vanguard" -- Category in the spawn menu

-- Weapon settings
SWEP.Slot = 1 -- Slot in the weapon selection menu
SWEP.SlotPos = 1 -- Slot position
SWEP.DrawAmmo = true -- Draw the ammo count
SWEP.DrawCrosshair = true -- Draw the crosshair
SWEP.DrawWeaponInfoBox = false -- Draw the weapon info box

-- Base weapon settings
SWEP.Spawnable = true -- Can be spawned via the Q menu
SWEP.AdminOnly = false -- Admin only spawn

-- Secondary gun settings, unused for now
SWEP.Secondary.ClipSize = -1 -- No secondary clip
SWEP.Secondary.DefaultClip = -1 -- No secondary default clip
SWEP.Secondary.Automatic = false -- Secondary fire automatic?
SWEP.Secondary.Ammo = "none" -- No secondary ammo

-- Weapon settings
SWEP.HoldType = "pistol" -- Weapon hold type
SWEP.UseHands = true -- Use hands model
SWEP.Sensitivity = 1 -- Sensitivity when not aiming

-- Primary gun settings
SWEP.Primary.ClipSize = 18 -- Size of a clip
SWEP.Primary.DefaultClip = 18 -- Default number of bullets in a clip
SWEP.Primary.Automatic = false -- Is this weapon automatic
SWEP.Primary.Ammo = "Pistol" -- Type of ammo

-- Primary fire settings
SWEP.Primary.Recoil = 1 -- Recoil effect
SWEP.Primary.Damage = 10 -- Damage per shot
SWEP.Primary.NumShots = 1 -- Number of shots per trigger pull
SWEP.Primary.Cone = 0.02 -- Bullet spread
SWEP.Primary.Delay = 0.5 -- Delay between shots
SWEP.Primary.RPM = 400 -- Rounds per minute, this is used instead of delay if it's set

-- Primary sound settings
SWEP.Primary.Sound = Sound("Weapon_Pistol.Single") -- Primary fire
SWEP.Primary.SoundEmpty = Sound("Weapon_Pistol.Empty") -- Primary fire when empty
SWEP.Primary.SoundLevel = 100 -- Sound level, used for sound distance
SWEP.Primary.SoundPitch = 100 -- Sound pitch
SWEP.Primary.SoundVolume = 1 -- Sound volume
SWEP.Primary.SoundChannel = CHAN_WEAPON -- Sound channel

-- Iron sights settings
SWEP.IronSightsEnabled = true -- Enable iron sights
SWEP.IronSightsPos = Vector(-6.035, 0, 3.029) -- Iron sights position
SWEP.IronSightsAng = Vector(0.2, -1.3, 1) -- Iron sights angle
SWEP.IronSightsFOV = 0.75 -- Iron sights field of view
SWEP.IronSightsCanMove = true -- Can the player iron sight while moving?
SWEP.IronSightsCanMoveRun = false -- Can the player iron sight while running?
SWEP.IronSightsDelay = 0.25 -- Delay between iron sights toggling
SWEP.IronSightsRunSpeed = 0.75 -- Check if the player is marked as running at this speed
SWEP.IronSightsToggle = false -- Is the iron sight a toggle mechanism, mark as false if it's a hold mechanism

-- Reloading settings
SWEP.Reloading = {}
SWEP.Reloading.Sequence = ACT_VM_RELOAD -- The reload animation
SWEP.Reloading.SequenceString = "reload" -- The reload animation as a string, this will be prioritized over the sequence
SWEP.Reloading.PlaybackRate = 1 -- The playback rate of the reload animation
SWEP.Reloading.Sound = Sound("Weapon_Pistol.Reload") -- The reload sound
SWEP.Reloading.SoundLevel = 60 -- The reload sound level, used for sound distance
SWEP.Reloading.SoundPitch = 100 -- The reload sound pitch
SWEP.Reloading.SoundVolume = 1 -- The reload sound volume
SWEP.Reloading.SoundChannel = CHAN_WEAPON -- The reload sound channel

-- Viewmodel settings
SWEP.ViewModel = "models/weapons/c_pistol.mdl" -- The model used in first-person view
SWEP.ViewModelFOV = 62 -- Viewmodel field of view
SWEP.ViewModelFlip = false -- Flip the viewmodel
SWEP.ViewModelOffset = Vector(0, 0, 0) -- Viewmodel offset
SWEP.ViewModelOffsetAng = Angle(0, 0, 0) -- Viewmodel angle offset
SWEP.ViewModelScale = 1 -- Viewmodel scale
SWEP.ViewModelDynamicLights = {
    --{Pos = Vector(0, 0, 0), Brightness = 1, Size = 128, Decay = 100, R = 255, G = 255, B = 255, DieTime = 0.1} -- Example
}

SWEP.ViewModelMaterial = "" -- Viewmodel material
SWEP.ViewModelColor = Color(255, 255, 255, 255) -- Viewmodel color
SWEP.ViewModelRenderMode = RENDERMODE_NORMAL -- Viewmodel render mode
SWEP.ViewModelRenderFX = kRenderFxNone -- Viewmodel render fx

-- Worldmodel settings
SWEP.WorldModel = "models/weapons/w_pistol.mdl" -- The model used in third-person view
SWEP.WorldModelBone = "ValveBiped.Bip01_R_Hand" -- The bone to attach the worldmodel to, this is required!
SWEP.WorldModelOffset = Vector(1.5, -5, 3.5) // Worldmodel offset
SWEP.WorldModelOffsetAng = Angle(0, 180, 180) // Worldmodel angle offset
SWEP.WorldModelScale = 1 -- Worldmodel scale
SWEP.WorldModelDynamicLights = {
    --{Pos = Vector(0, 0, 0), Brightness = 1, Size = 128, Decay = 100, R = 255, G = 255, B = 255, DieTime = 0.1} -- Example
}

SWEP.WorldModelMaterial = "" -- Worldmodel material
SWEP.WorldModelColor = Color(255, 255, 255, 255) -- Worldmodel color
SWEP.WorldModelRenderMode = RENDERMODE_NORMAL -- Worldmodel render mode
SWEP.WorldModelRenderFX = kRenderFxNone -- Worldmodel render fx

-- Recoil settings
SWEP.Recoil = {}
SWEP.Recoil.Punch = Angle(1, 0, 0) -- Punch angle

-- Bob settings
SWEP.Bob = {}
SWEP.Bob.Scale = 1
SWEP.Bob.Speed = 1

-- Sway settings
SWEP.Sway = {}
SWEP.Sway.Scale = 1
SWEP.Sway.Speed = 1
```

## Documentation

### Base Settings

- **SWEP.Base**: The base weapon script to use.
- **SWEP.PrintName**: The name displayed in the HUD.
- **SWEP.Author**: The author of the weapon.
- **SWEP.Instructions**: Instructions for using the weapon.
- **SWEP.Category**: The category in the spawn menu.

### Weapon Settings

- **SWEP.Slot**: The slot in the weapon selection menu.
- **SWEP.SlotPos**: The position in the slot.
- **SWEP.DrawAmmo**: Whether to draw the ammo count.
- **SWEP.DrawCrosshair**: Whether to draw the crosshair.
- **SWEP.DrawWeaponInfoBox**: Whether to draw the weapon info box.
- **SWEP.Spawnable**: Whether the weapon can be spawned via the Q menu.
- **SWEP.AdminOnly**: Whether the weapon can only be spawned by admins.

### Base Weapon Settings

- **SWEP.HoldType**: The hold type of the weapon.
- **SWEP.UseHands**: Whether to use the hands model.
- **SWEP.Sensitivity**: The sensitivity when not aiming.

### Primary Weapon Settings

- **SWEP.Primary.ClipSize**: The size of the clip.
- **SWEP.Primary.DefaultClip**: The default number of bullets in a clip.
- **SWEP.Primary.Automatic**: Whether the weapon is automatic.
- **SWEP.Primary.Ammo**: The type of ammo used.

### Primary Fire Settings

- **SWEP.Primary.Recoil**: The recoil effect.
- **SWEP.Primary.Damage**: The damage per shot.
- **SWEP.Primary.NumShots**: The number of shots per trigger pull.
- **SWEP.Primary.Cone**: The bullet spread.
- **SWEP.Primary.Delay**: The delay between shots.
- **SWEP.Primary.RPM**: Rounds per minute, used instead of delay if set.

### Sound Settings

- **SWEP.Primary.Sound**: The primary fire sound.
- **SWEP.Primary.SoundLevel**: The sound level for sound distance.
- **SWEP.Primary.SoundPitch**: The sound pitch.
- **SWEP.Primary.SoundVolume**: The sound volume.
- **SWEP.Primary.SoundChannel**: The sound channel.

### Iron Sights Settings

- **SWEP.IronSightsEnabled**: Whether iron sights are enabled.
- **SWEP.IronSightsPos**: The position of the iron sights.
- **SWEP.IronSightsAng**: The angle of the iron sights.
- **SWEP.IronSightsFOV**: The field of view for the iron sights.
- **SWEP.IronSightsSensitivity**: The sensitivity when aiming down sights.
- **SWEP.IronSightsCanMove**: Whether the player can move while iron sighting.
- **SWEP.IronSightsCanMoveRun**: Whether the player can run while iron sighting.
- **SWEP.IronSightsDelay**: The delay between iron sights toggling.
- **SWEP.IronSightsRunSpeed**: The speed at which the player is marked as running.
- **SWEP.IronSightsToggle**: Whether the iron sight is a toggle mechanism.

### Reloading Settings

- **SWEP.Reloading.Sequence**: The reload animation sequence.
- **SWEP.Reloading.SequenceString**: The reload animation as a string.
- **SWEP.Reloading.PlaybackRate**: The playback rate of the reload animation.
- **SWEP.Reloading.Sound**: The reload sound.
- **SWEP.Reloading.SoundLevel**: The reload sound level for sound distance.
- **SWEP.Reloading.SoundPitch**: The reload sound pitch.
- **SWEP.Reloading.SoundVolume**: The reload sound volume.
- **SWEP.Reloading.SoundChannel**: The reload sound channel.

### Viewmodel Settings

- **SWEP.ViewModel**: The model used in first-person view.
- **SWEP.ViewModelFOV**: The viewmodel field of view.
- **SWEP.ViewModelFlip**: Whether to flip the viewmodel.
- **SWEP.ViewModelOffset**: The viewmodel offset.
- **SWEP.ViewModelOffsetAng**: The viewmodel angle offset.
- **SWEP.ViewModelScale**: The viewmodel scale.
- **SWEP.ViewModelDynamicLights**: Dynamic lights for the viewmodel.
- **SWEP.ViewModelMaterial**: The viewmodel material.
- **SWEP.ViewModelColor**: The viewmodel color.
- **SWEP.ViewModelRenderMode**: The viewmodel render mode.
- **SWEP.ViewModelRenderFX**: The viewmodel render fx.

### Worldmodel Settings

- **SWEP.WorldModel**: The model used in third-person view.
- **SWEP.WorldModelBone**: The bone to attach the worldmodel to.
- **SWEP.WorldModelOffset**: The worldmodel offset.
- **SWEP.WorldModelOffsetAng**: The worldmodel angle offset.
- **SWEP.WorldModelScale**: The worldmodel scale.
- **SWEP.WorldModelDynamicLights**: Dynamic lights for the worldmodel.
- **SWEP.WorldModelMaterial**: The worldmodel material.
- **SWEP.WorldModelColor**: The worldmodel color.
- **SWEP.WorldModelRenderMode**: The worldmodel render mode.
- **SWEP.WorldModelRenderFX**: The worldmodel render fx.

### Recoil Settings

- **SWEP.Recoil.Punch**: The punch angle for recoil.

### Bobbing Settings

- **SWEP.Bob.Scale**: The bob scale.
- **SWEP.Bob.Speed**: The bob speed.

### Sway Settings

- **SWEP.Sway.Scale**: The sway scale.
- **SWEP.Sway.Speed**: The sway speed.

## Contributing

You are free to contribute! Aslong as it fits the coding format I am using.

## License

This project is licensed under the MIT License. Please keep my credits intact though.
