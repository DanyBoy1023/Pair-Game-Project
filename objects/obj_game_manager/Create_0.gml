randomise()

enum GAME_STATE {
	WAITING,
	THROWING,
	MOVING,
	REELING,
	CATCHING
}
state = GAME_STATE.WAITING

// progress will increase as the player pulls the fish towards the center correctly
progress = 0



function throw_bobble()
{
	state = GAME_STATE.THROWING
}

function reached_water()
{
	state = GAME_STATE.MOVING
}

function reel() 
{
	progress = 0
	state = GAME_STATE.REELING
}

function catch_fih()
{
	state = GAME_STATE.CATCHING
}

function lose_fih()
{
	state = GAME_STATE.WAITING
	instance_destroy(obj_fih_parent)
	obj_fih_spawner.spawn_random_fih()
}

