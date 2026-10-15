var game_state = obj_game_manager.state

if game_state == GAME_STATE.WAITING or game_state == GAME_STATE.CATCHING
{
	visible = true
}
else
{
	visible = false
}