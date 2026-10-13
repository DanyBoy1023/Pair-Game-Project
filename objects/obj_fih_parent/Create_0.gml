randomise()
// 1 == right | -1 == left
side = 1

spawn_scale = .1
image_xscale = spawn_scale
image_yscale = spawn_scale

escaping = false
// how much the fish moves down and up when you're succesfully pulling in the right or wrong direction
progress_gain = .3
progress_loss = .1


// how long until the fish goes away and you fail to catch it
lose_alarm_seconds = 10

alarm[3] = random_range(lose_alarm_seconds/2, lose_alarm_seconds) * FPS

shadow = sp_fih_shadow
fih_sprite = sprite_index
sprite_index = shadow
// the position the fish will move to at random intervals
goto_x = x
start_x = x

// variables for animation curve for when the fih is being reeled in
curve_channel = animcurve_get_channel(reeling_curve, 0); 
animation_percent = 0
animation_speed = reeling_move_speed/100;

// variables for random idle movement
velocity = 0
accelaration = .01

room_middle = room_width/2

fishing_pole_center = obj_fih_pole_tip.x

function start_reeling()
{
	set_side()
	set_goto_to_new_spot()
	//set_random_move_duration()
	alarm[1] = lose_alarm_seconds * FPS
	start_x = x
	// stop going away
	alarm[3] = 0
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
	alarm[0] = random_range(min_wait_time * FPS, max_wait_time * FPS)
}

function escape()
{
	escaping = true
}

function set_side()
{
	// if the fih's x position is greater than the fishing pole, then the fih is on the right
	if x > fishing_pole_center 
	{
		side = 1
	}
	else 
	{
		side = -1
	}
}

// when fih is spawned, move to a valid spot for this fih

side = choose(-1, 1)
goto_x = obj_fih_pole_tip.x
set_goto_to_new_spot()
x = goto_x