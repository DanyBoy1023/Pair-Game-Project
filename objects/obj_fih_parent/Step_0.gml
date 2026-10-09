
x = lerp(x, goto_x, .2)

// if the fih's x position is greater than the fishing pole, then the fih is on the right
if x > fishing_pole_center 
{
	side = 1
}
else 
{
	side = -1
}

y = clamp(y, obj_fih_landing_spot.y, room_height)