
possible_fih_spawns = [obj_fast_fih, obj_slow_fih, obj_small_fih]

max_fih_amount = 3

min_fih_spawn_wait_seconds = 1
max_fih_spawn_wait_seconds = 2
waiting_to_spawn = false

start_fih_spawn()

function start_fih_spawn()
{
	alarm[0] = random_range(min_fih_spawn_wait_seconds * FPS, max_fih_spawn_wait_seconds * FPS)
	waiting_to_spawn = true
}

function spawn_random_fih()
{
	var fih = instance_create_layer(0,obj_fih_landing_spot.y, "Fih", get_random_fih_to_spawn())
}

function get_random_fih_to_spawn()
{
	return possible_fih_spawns[random_range(0, array_length(possible_fih_spawns))]
}