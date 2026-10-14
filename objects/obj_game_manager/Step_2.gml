if state == GAME_STATE.EVIL_DAMAGE
{
	cought_fih.sprite_index = sp_evil_fih_attack
	var target_scale = 5
	with cought_fih
	{
		x = room_width/2
		y = room_height/2
		image_xscale = lerp(image_xscale, target_scale, .1)
		image_yscale = lerp(image_xscale, target_scale, .1)
	}
	if cought_fih.image_xscale >= target_scale* 10/11
	{
		with cought_fih
		{
			image_alpha = lerp(image_alpha, 0, .2)
		}
		if cought_fih.image_alpha <= .2
		{
			obj_health_bar.take_damage()
			state = GAME_STATE.WAITING
			obj_fih_spawner.start_fih_spawn()
		}
	}
}