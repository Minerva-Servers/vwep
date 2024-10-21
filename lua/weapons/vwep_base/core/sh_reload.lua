

function VWEP:CanReload()
    local ply = self:GetOwner()
    if ( !IsValid(ply) ) then return false end

    if ( self:GetReloading() ) then return false end

    // We might be wanting to switch fire modes, so prevent reloading
    if ( self.FireModes.Enabled and ply:KeyDown(IN_SPEED) ) then return false end

    return self:Clip1() < self.Primary.ClipSize and self:GetOwner():GetAmmoCount(self.Primary.Ammo) > 0
end

function VWEP:Reload()
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

    if ( self.Cycling.Enabled ) then
        if ( self.Cycling.Automatic ) then
            local _, duration = self:PlayAnimation(self.Cycling.SequenceEntry, self.Cycling.PlaybackRate)
            duration = duration + self.Cycling.Delay

            self:QueueIdle()

            self:SetNextPrimaryFire(CurTime() + duration)
            self:SetNextSecondaryFire(CurTime() + duration)

            timer.Create("VWEP.Cycling." .. self:EntIndex(), duration, 0, function()
                if ( !IsValid(self) ) then return end

                if ( self:Clip1() < self.Primary.ClipSize ) then
                    // Reset the animation so we can replay the cycling animation
                    self:PlayAnimation(self.Cycling.SequenceEntry, self.Cycling.PlaybackRate)

                    timer.Simple(0, function()
                        local _, duration = self:PlayAnimation(self.Cycling.Sequence, self.Cycling.PlaybackRate)
                        self:QueueIdle()
                    end)

                    self:SetNextPrimaryFire(CurTime() + duration)
                    self:SetNextSecondaryFire(CurTime() + duration)

                    local cycleSound, cycleSoundLevel, cycleSoundPitch, cycleSoundVolume, cycleSoundChannel = self.Cycling.Sound, self.Cycling.SoundLevel, self.Cycling.SoundPitch, self.Cycling.SoundVolume, self.Cycling.SoundChannel
                    self:EmitSound(cycleSound, cycleSoundLevel or 60, cycleSoundPitch or 100, cycleSoundVolume or 1, cycleSoundChannel or CHAN_WEAPON)

                    self:SetClip1(self:Clip1() + 1)
                else
                    timer.Remove("VWEP.Cycling." .. self:EntIndex())

                    local _, duration = self:PlayAnimation(self.Cycling.SequenceExit, self.Cycling.PlaybackRate)
                    self:QueueIdle()

                    self:SetNextPrimaryFire(CurTime() + duration)
                    self:SetNextSecondaryFire(CurTime() + duration)

                    timer.Simple(duration, function()
                        if ( !IsValid(self) ) then return end

                        if ( self.PreReloadFinish ) then
                            self:PreReloadFinish()
                        end

                        self:SetReloading(false)

                        if ( self.PostReloadFinish ) then
                            self:PostReloadFinish()
                        end
                    end)
                end
            end)
        else
            local _, duration = self:PlayAnimation(self.Cycling.SequenceEntry, self.Cycling.PlaybackRate)
            self:QueueIdle()

            self:SetNextPrimaryFire(CurTime() + duration)
            self:SetNextSecondaryFire(CurTime() + duration)

            timer.Simple(duration, function()
                if ( !IsValid(self) ) then return end

                local ammo = self.Cycling.Ammo
                local ammoToTake = math.min(ammo, ply:GetAmmoCount(self.Primary.Ammo))
                ply:RemoveAmmo(ammoToTake, self.Primary.Ammo)
                self:SetClip1(self:Clip1() + ammoToTake)

                local _, duration = self:PlayAnimation(self.Cycling.Sequence, self.Cycling.PlaybackRate)
                self:QueueIdle()

                self:SetNextPrimaryFire(CurTime() + duration)
                self:SetNextSecondaryFire(CurTime() + duration)

                local cycleSound, cycleSoundLevel, cycleSoundPitch, cycleSoundVolume, cycleSoundChannel = self.Cycling.Sound, self.Cycling.SoundLevel, self.Cycling.SoundPitch, self.Cycling.SoundVolume, self.Cycling.SoundChannel
                self:EmitSound(cycleSound, cycleSoundLevel or 60, cycleSoundPitch or 100, cycleSoundVolume or 1, cycleSoundChannel or CHAN_WEAPON)

                timer.Simple(duration, function()
                    if ( !IsValid(self) ) then return end

                    local _, duration = self:PlayAnimation(self.Cycling.SequenceExit, self.Cycling.PlaybackRate)
                    self:QueueIdle()

                    self:SetNextPrimaryFire(CurTime() + duration)
                    self:SetNextSecondaryFire(CurTime() + duration)

                    timer.Simple(duration, function()
                        if ( !IsValid(self) ) then return end

                        if ( self.PreReloadFinish ) then
                            self:PreReloadFinish()
                        end

                        self:SetReloading(false)

                        if ( self.PostReloadFinish ) then
                            self:PostReloadFinish()
                        end
                    end)

                    if ( self.PostReload ) then
                        self:PostReload()
                    end
                end)
            end)
        end
    else
        local clip = self:Clip1()
        local vmReload = self:GetViewModelReloadAnimation(bIronsighted)
        local vm = ply:GetViewModel()
        local _, duration = self:PlayAnimation(vmReload, clip <= 0 and self.Reloading.PlaybackRateEmpty or self.Reloading.PlaybackRate)
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
end