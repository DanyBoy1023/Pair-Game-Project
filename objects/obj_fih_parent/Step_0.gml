var game_state = obj_game_manager.state
if game_state == GAME_STATE.EVIL_DAMAGE
{
	return
}
// random movement when waiting
if game_state != GAME_STATE.REELING
{
	// slowly move towards random spot
	// I need a move toward or a speed, that lowers to 0 then accelarates to a new point
	
	// get the direction to go
	var dir = sign(goto_x - x)
	
	// add the accelaration based on direction
	velocity += accelaration * DELTA * dir
	// make sure it doesn't go past the max speed
	velocity = clamp(velocity, -move_speed, move_speed)
	
	// if they reached the target then get a new point to go to
	if abs(x - goto_x) <= move_speed * DELTA
	{
		goto_x = random_range(outter_gap, room_width-outter_gap)
	}
	// add velocity to the x
	x += velocity * DELTA
}


// random movement when reeling in the fih
if game_state == GAME_STATE.REELING
{
	if obj_bobble.reeling_fih == self
	{
		// get the amount from the curve
		animation_percent += animation_speed;
		var timer_amount = alarm[0]
		if animation_percent > 1 and alarm[0] <= 0
		{
			set_random_move_duration()
		}
		else if animation_percent < 1
		{
			var _curve_value = animcurve_channel_evaluate(curve_channel, animation_percent);
		
			x = lerp(start_x, goto_x, _curve_value)
		}

		set_side()

		// make sure the fih doesn't move too far up or too far down
		y = clamp(y, obj_fih_landing_spot.y, room_height)
	}
}

// if this fih is escaping, turn smaller until it kills itself
if escaping
{
	var new_scale = lerp(image_xscale, 0, .2)
	image_xscale = new_scale
	image_yscale = new_scale
	if image_xscale <= .05
	{
		instance_destroy(self)
	}
}
else
{
	var new_scale = lerp(image_xscale, scale, .1)
	image_xscale = new_scale
	image_yscale = new_scale
}

