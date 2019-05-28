with (par_player) {
	remaining_movement = moving_speed;
	attacked = false;
}
if (instance_number(par_enemy) > 0 && instance_number(par_player) > 0) {
	global.state = states.ai_turn;
}
