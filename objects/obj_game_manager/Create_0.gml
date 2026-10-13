/*
3 lives
when they lose a fih 
*/

randomise()

enum GAME_STATE {
	WAITING,
	THROWING,
	MOVING,
	REELING,
	CATCHING
}
state = GAME_STATE.WAITING

// progress will increase as the player pulls the fish towards the center correctly
progress = 0

catch_count = 0


function throw_bobble()
{
	state = GAME_STATE.THROWING
	obj_fih_pole_tip.image_speed = 1
}

function reached_water()
{
	state = GAME_STATE.MOVING
	obj_fih_pole_tip.image_speed = 0
}

function reel() 
{
	progress = 0
	state = GAME_STATE.REELING
	// go through each fih active in the game and set their escape timers
	var _delay = .1
	var i = 1
	with obj_fih_parent
	{
		if obj_bobble.reeling_fih != self
		{
			alarm[2] = _delay * i * FPS
			i++
		}
	}
}

function catch_fih()
{
	catch_count++
	
	state = GAME_STATE.CATCHING
	// reset fih so it don't run any more alarms
	obj_fih_parent.alarm[0] = 0
	obj_fih_parent.alarm[1] = 0
	
	obj_fih_parent.image_xscale = .1
	obj_fih_parent.image_yscale = .1
	
	obj_fih_pole_tip.image_speed = 0
	// start spawning new fih
	obj_fih_spawner.start_fih_spawn()
}

function lose_fih()
{
	state = GAME_STATE.WAITING
	obj_fih_parent.escape()
	// start spawning new fih
	obj_fih_spawner.start_fih_spawn()
}

