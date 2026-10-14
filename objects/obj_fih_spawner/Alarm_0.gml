var game_state = obj_game_manager.state
if game_state != GAME_STATE.REELING
{
	spawn_random_fih()
	waiting_to_spawn = false
}