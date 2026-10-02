// Controls all the fishing states and cycles between them
if state == GAME_STATE.WAITING
{
	if keyboard_check(vk_space)
	{
		throw_bobble()
	}
}