// this will move the fish to another position on the other side of the sea

// if they are on the right side, then get a point on the left side
if side == 1
{
	goto_x = random_range(0, room_middle)
}
else
{
	goto_x = random_range(room_middle, room_width)
}

alarm[0] = random_range(50, 100)