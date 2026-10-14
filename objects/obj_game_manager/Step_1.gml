// Controls all the fishing states and cycles between them
if state == GAME_STATE.WAITING
{
	if keyboard_check_pressed(vk_space)
	{
		throw_bobble()
	}
}

if state == GAME_STATE.CATCHING or state == GAME_STATE.EVIL_DAMAGE
{
	var _cought_fih = cought_fih
	with obj_fih_parent
	{
		if _cought_fih == self
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
	}
	if state == GAME_STATE.EVIL_DAMAGE and mid_lose_animation
	{
		cought_fih.image_xscale = .1
		cought_fih.image_yscale = .1
	}
	if keyboard_check_pressed(vk_space) and state != GAME_STATE.EVIL_DAMAGE
	{
		state = GAME_STATE.WAITING
		instance_destroy(cought_fih)
	}
}

