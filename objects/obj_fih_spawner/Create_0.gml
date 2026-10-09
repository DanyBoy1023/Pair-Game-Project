
possible_fih_spawns = [obj_fast_fih]


function spawn_random_fih()
{
	var fih = instance_create_layer(0,obj_fih_landing_spot.y, "Fih", get_random_fih_to_spawn())
}

function get_random_fih_to_spawn()
{
	return possible_fih_spawns[random_range(0, array_length(possible_fih_spawns))]
}