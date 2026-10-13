// Controls all the fishing states and cycles between them
if state == GAME_STATE.WAITING
{
	if keyboard_check_pressed(vk_space)
	{
		throw_bobble()
	}
}

if state == GAME_STATE.CATCHING
{
	with obj_fih_parent
	{
		// move fish towards the center of the screen while also making it bigger
		sprite_index = fih_sprite
		
		var lerp_amount = .2
		
		x = lerp(x, room_width/2, lerp_amount)
		y = lerp(y, room_height/2, lerp_amount)
		
		var final_scale = 2
		
		image_xscale = lerp(image_xscale, final_scale, lerp_amount)
		image_yscale = lerp(image_yscale, final_scale, lerp_amount)
	}
	
	if keyboard_check_pressed(vk_space)
	{
		state = GAME_STATE.WAITING
		instance_destroy(obj_fih_parent)
	}
}