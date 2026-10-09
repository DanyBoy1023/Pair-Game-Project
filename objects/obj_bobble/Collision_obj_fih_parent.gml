if obj_game_manager.state == GAME_STATE.MOVING
{
	// If the bobble head touches the fish while in the water then initiate the reeling sequenec
	reeling_fih = other
	reeling_fih.x = x
	obj_game_manager.reel()
	reeling_fih.start_reeling()
}