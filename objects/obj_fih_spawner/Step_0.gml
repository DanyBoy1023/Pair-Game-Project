var game_state = obj_game_manager.state
var catch_count = obj_game_manager.catch_count

if game_state != GAME_STATE.REELING
{
	var fih_count = instance_number(obj_fih_parent)
	
	if game_state == GAME_STATE.CATCHING
	{
		fih_count--
	}
	
	// if this is the player's third catch, then guarantee the evil fih to spawn alone
	if catch_count == forced_evil_spawn
	{
		replace_spawn_with_evil_spawn = true
		if not waiting_to_spawn and fih_count < 1
		{
			start_fih_spawn()
		}
	}
	else if not waiting_to_spawn and fih_count < max_fih_amount
	{
		start_fih_spawn()
	}
}
