/*
every x amount of spawns, spawns an evil fih
*/

possible_fih_spawns = [obj_fast_fih, obj_slow_fih, obj_small_fih]


max_fih_amount = 3

min_fih_spawn_wait_seconds = 1
max_fih_spawn_wait_seconds = 2
waiting_to_spawn = false

replace_spawn_with_evil_spawn = false
spawn_count = 0
forced_evil_spawn = 2

start_fih_spawn()

function start_fih_spawn()
{
	alarm[0] = random_range(min_fih_spawn_wait_seconds * FPS, max_fih_spawn_wait_seconds * FPS)
	alarm[0] = max(alarm[0], 2)
	waiting_to_spawn = true
}

function spawn_random_fih()
{
	spawn_count++
	instance_create_layer(0,obj_fih_landing_spot.y, "Fih", get_random_fih_to_spawn())
}

function get_random_fih_to_spawn()
{
	if obj_game_manager.catch_count >= forced_evil_spawn and (replace_spawn_with_evil_spawn or spawn_count % 4 == 0)
	{
		replace_spawn_with_evil_spawn = false
		return obj_evil_fih
	}
	return possible_fih_spawns[random_range(0, array_length(possible_fih_spawns))]
}