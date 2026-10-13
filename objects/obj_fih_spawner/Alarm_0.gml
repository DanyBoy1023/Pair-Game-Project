var game_state = obj_game_manager.state
if game_state == GAME_STATE.WAITING or game_state == GAME_STATE.MOVING or game_state == GAME_STATE.THROWING
{
	spawn_random_fih()
	waiting_to_spawn = false
}