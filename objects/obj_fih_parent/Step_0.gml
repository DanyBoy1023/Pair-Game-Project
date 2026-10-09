var game_state = obj_game_manager.state


if game_state == GAME_STATE.WAITING or game_state == GAME_STATE.MOVING
{
	// slowly move towards random spot
	
}

if game_state == GAME_STATE.REELING
{
	if obj_bobble.reeling_fih == self
	{
		// if this is the fih that is being reeled in then go as normal
		x = lerp(x, goto_x, .2)

		// if the fih's x position is greater than the fishing pole, then the fih is on the right
		if x > fishing_pole_center 
		{
			side = 1
		}
		else 
		{
			side = -1
		}

		y = clamp(y, obj_fih_landing_spot.y, room_height)
	}
}

// if this fih is escaping, turn smaller until it kills itself
if escaping
{
	scale = lerp(scale, 0, .2)
	image_xscale = scale
	image_yscale = scale
	if scale <= .05
	{
		instance_destroy(self)
	}
}

