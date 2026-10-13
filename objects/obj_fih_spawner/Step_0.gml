var game_state = obj_game_manager.state

if game_state == GAME_STATE.WAITING or game_state == GAME_STATE.MOVING or game_state == GAME_STATE.THROWING
{
	var fih_count = instance_number(obj_fih_parent)
	if not waiting_to_spawn and fih_count < max_fih_amount
	{
		start_fih_spawn()
	}
}
