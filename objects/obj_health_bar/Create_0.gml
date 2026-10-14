image_speed = 0

hp = 3
image_index = hp

function take_damage()
{
	hp--
	if hp <= 0
	{
		obj_game_manager.end_game()
	}
	image_index = hp
	obj_damage_overlay.flash_overlay()
}