
x = lerp(x, goto_x, .2)


if x > room_middle
{
	side = 1
}
else 
{
	side = -1
}

y = clamp(y, 0, room_height)