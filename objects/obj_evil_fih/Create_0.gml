// Inherit the parent event
event_inherited();

// the evil fih tries to copy the swimming pattern of the other fishes

// small, fast, slow
var small_fih = instance_create_layer(0,0, "Fih", obj_small_fih)
var fast_fih = instance_create_layer(0,0, "Fih", obj_fast_fih)
var slow_fih = instance_create_layer(0,0, "Fih", obj_slow_fih)

var fih_types = [small_fih, fast_fih, slow_fih]

// shuffle the list and get the first 2 fishes so the evil fish always has an incorrect combination
randomise()
fih_types = array_shuffle(fih_types)


reeling_curve = fih_types[0].reeling_curve

scale = fih_types[1].scale

// movement variables
reeling_move_speed = fih_types[2].reeling_move_speed

min_distance_change = fih_types[2].min_distance_change

max_distance_change = fih_types[2].max_distance_change

middle_gap = fih_types[2].middle_gap

// destroy the temporary spawned fih
instance_destroy(small_fih)
instance_destroy(fast_fih)
instance_destroy(slow_fih)