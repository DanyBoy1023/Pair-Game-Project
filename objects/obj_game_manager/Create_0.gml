draw_set_font(fnt_kenney_mini)
/*
3 lives
when they lose a fih 
*/

randomise()

enum GAME_STATE {
	DEAD,
	WAITING,
	THROWING,
	MOVING,
	REELING,
	CATCHING,
	EVIL_DAMAGE
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
	obj_bobble.sprite_index = obj_bobble.idle_water_sprite
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

cought_fih = obj_fih_parent

sequence_id = noone
mid_lose_animation = false
function catch_fih(fih)
{
	catch_count++
	
	state = GAME_STATE.CATCHING
	// reset fih so it don't run any more alarms
	cought_fih = fih
	with cought_fih
	{
		alarm[0] = 0
		alarm[1] = 0
	
		image_xscale = .1
		image_yscale = .1
	
		image_speed = 0
	}
	if cought_fih.object_index == obj_evil_fih
	{
		state = GAME_STATE.EVIL_DAMAGE
		
		alarm[0] = 2 * FPS
	}
	else
	{
		// start spawning new fih
		obj_fih_spawner.start_fih_spawn()
	}
	obj_bobble.sprite_index = obj_bobble.out_of_water_sprite
}
function end_attack_seq()
{
	state = GAME_STATE.WAITING
	mid_lose_animation = false
	instance_destroy(cought_fih)
	layer_sequence_destroy(sequence_id)
	obj_health_bar.take_damage()
	obj_fih_spawner.start_fih_spawn()
}
function lose_fih()
{
	state = GAME_STATE.WAITING
	if obj_fih_parent.object_index != obj_evil_fih
	{
		obj_health_bar.take_damage()
	}
	obj_fih_parent.escape()
	// start spawning new fih
	obj_fih_spawner.start_fih_spawn()
	obj_bobble.sprite_index = obj_bobble.out_of_water_sprite
}

function end_game()
{
	state = GAME_STATE.DEAD
	obj_death_menu.visible = true
}