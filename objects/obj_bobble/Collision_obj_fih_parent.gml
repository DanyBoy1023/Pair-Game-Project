if obj_game_manager.state == GAME_STATE.MOVING
{
	// If the bobble head touches the fish while in the water then initiate the reeling sequenec
	reeling_fih = other
	reeling_fih.x = x
	obj_game_manager.reel()
	reeling_fih.alarm[0] = reeling_fih.move_speed
	reeling_fih.alarm[1] = reeling_fih.lose_alarm_seconds * game_get_speed(gamespeed_fps);
}