var game_state = obj_game_manager.state

var _y = obj_bobble.y -20
var gap = 8

if game_state == GAME_STATE.REELING
{
	var side = obj_fih_parent.side
	image_index = 0
	// they are on the right and need to pull to the left
	if side == 1
	{
		if keyboard_check(vk_left)
		{
			image_index = 10
		}
		draw_sprite(spr_left_anim, image_index, obj_bobble.x-gap, _y)
	}
	// they are on the left and need to pull to the right
	if side == -1
	{
		if keyboard_check(vk_right)
		{
			image_index = 10
		}
		draw_sprite(spr_right_anim, image_index, obj_bobble.x+gap, _y)
	}
}
if game_state == GAME_STATE.THROWING or game_state == GAME_STATE.MOVING
{
	image_index = 0
	if keyboard_check(vk_left)
	{
		image_index = 10
	}
	draw_sprite(spr_left_anim, image_index, obj_bobble.x-gap, _y)
	
	image_index = 0
	if keyboard_check(vk_right)
	{
		image_index = 10
	}
	draw_sprite(spr_right_anim, image_index, obj_bobble.x+gap, _y)
}