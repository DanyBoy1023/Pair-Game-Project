move_speed = 1

reeling_fih = obj_fih_parent


// animation curve to animate the throwing of the fishing pole
curve_channel = animcurve_get_channel(ac_throwing_position, 0); 

// Track the progression/time of the animation (0 = start, 1 = end)
animation_percent = 0; 
animation_speed = 0.01; // How fast it moves from 0 to 1

throw_start_y = obj_fih_pole_tip.y
throw_end_y = obj_fih_landing_spot.y