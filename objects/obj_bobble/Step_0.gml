// get current game state
var game_state = obj_game_manager.state

var _move_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _move_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));


// Calculate horizontal movement direction (returns -1, 0, or 1)
var _hmove = _move_right - _move_left;

if game_state == GAME_STATE.WAITING or game_state == GAME_STATE.CATCHING or game_state == GAME_STATE.EVIL_DAMAGE
{
	x = lerp(x, obj_fih_pole_tip.x, .2)
	y = lerp(y, obj_fih_pole_tip.y, .2)
}

if game_state == GAME_STATE.THROWING or game_state == GAME_STATE.MOVING
{
	// Move the bobble in the direction the player pressed
	x += _hmove * move_speed * DELTA
	// Clamp the x so the bobble doesn't move out of the room
	x = clamp(x, 0, room_width)
}

// Animation for the boble to move when thrown
if game_state == GAME_STATE.THROWING
{
	animation_percent += animation_speed;
	if (animation_percent > 1) 
	{
	    animation_percent = 0
		obj_game_manager.reached_water()
	}
	else
	{
		var _curve_value = animcurve_channel_evaluate(curve_channel, animation_percent);
		
		y = lerp(throw_start_y, throw_end_y, _curve_value)
	}
}

if game_state == GAME_STATE.REELING
{
	x = reeling_fih.x
	y = reeling_fih.y
	// if the player is pulling in the opposite direction add to the progress
	if _hmove == reeling_fih.side * -1
	{
		// correct reeling
		obj_game_manager.progress += reeling_fih.progress_gain
		reeling_fih.y += reeling_fih.progress_gain * DELTA
		obj_fih_pole_tip.image_speed = 1
	}
	else
	{
		// incorrect reeling
		reeling_fih.y -= reeling_fih.progress_loss * DELTA
		obj_fih_pole_tip.image_speed = 0
	}
}

var scale = 1
if sprite_index == reeling_sprite or sprite_index == idle_water_sprite
{
	scale = 1/5
}
image_xscale = scale
image_yscale = scale