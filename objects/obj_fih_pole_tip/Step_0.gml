var game_state = obj_game_manager.state

if game_state == GAME_STATE.CATCHING or game_state == GAME_STATE.WAITING
{
	if place_meeting(x, y, obj_bobble)
	{
		image_speed = 0
	}
	else
	{
		image_speed = 1
	}
}