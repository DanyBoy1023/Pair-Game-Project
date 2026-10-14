var game_state = obj_game_manager.state

if game_state != GAME_STATE.REELING
{
	var fih_count = instance_number(obj_fih_parent)
	if game_state == GAME_STATE.CATCHING
	{
		fih_count--
	}
	if not waiting_to_spawn and fih_count < max_fih_amount
	{
		start_fih_spawn()
	}
}
