
-- luacheck: ignore 111

--[[--
Base functions for weapons.

The Weapon Base comes with a few functions that can be used to modify the weapon's behavior. These functions are called by the weapon base itself and should be overwritten by the weapon's code.
]]
-- @api Base

--- Called before the primary attack. Can be used to check if the player can attack.
-- @realm shared
-- @player client The client that is using the weapon
-- @return boolean Whether the player can attack or not
-- @usage function SWEP:PrePrimaryAttack(client)
-- 	return client:IsAdmin() -- only admins can attack with this weapon
-- end
function PrePrimaryAttack(client)
end