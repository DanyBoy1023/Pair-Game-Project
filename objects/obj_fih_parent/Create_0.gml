randomise()
// 1 == right | -1 == left
side = 1

scale = 1

escaping = false
// how much the fish moves down and up when you're succesfully pulling in the right or wrong direction
progress_gain = .3
progress_loss = .1


// how long until the fish goes away and you fail to catch it
lose_alarm_seconds = 10

shadow = sp_fih_shadow
fih_sprite = sprite_index
sprite_index = shadow
// the position the fish will move to at random intervals
goto_x = x

room_middle = room_width/2

fishing_pole_center = obj_fih_pole_tip.x

// the things that will differ is the movement speed
move_speed = 10

function start_reeling()
{
	set_random_move_duration()
	alarm[1] = lose_alarm_seconds * FPS
}

function set_goto_to_new_spot()
{
	// if they are on the right side, then get a point on the left side
	if side == 1
	{
		// randomly get a point on the LEFT side of the pole
		var old_goto = goto_x
		
		// the right most side of the random generation
		var right_margin = fishing_pole_center - middle_gap
		var right_min_dist = old_goto - min_distance_change
		
		right_margin = min(right_margin, right_min_dist)
		
		// the left most side of the random generation
		var left_margin = outter_gap
		var left_max_dist = old_goto - max_distance_change
		
		left_margin = max(left_margin, left_max_dist)
		
		goto_x = random_range(left_margin, right_margin)
	}
	else
	{
		// randomly get a point on the LEFT side of the pole
		var old_goto = goto_x
		
		// the left most side of the random generation
		var right_margin = room_width - outter_gap
		var right_max_dist = old_goto + max_distance_change
		
		right_margin = min(right_margin, right_max_dist)
		
		// the right most side of the random generation
		var left_margin = fishing_pole_center + middle_gap
		var left_min_dist = old_goto + min_distance_change
		
		left_margin = max(left_margin, left_min_dist)
		
		
		goto_x = random_range(left_margin, right_margin)
	}
}

function set_random_move_duration()
{
	alarm[0] = random_range(min_move_duration * FPS, max_move_duration* FPS)
}

function escape()
{
	escaping = true
}


// when fih is spawned, move to a valid spot for this fih

side = choose(-1, 1)
goto_x = obj_fih_pole_tip.x
set_goto_to_new_spot()
x = goto_x