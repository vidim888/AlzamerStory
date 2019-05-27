/// State Control
switch(global.state) {
	case states.p_turn: scr_state_player_turn(); break;
	case states.ai_turn: scr_state_ai_turn(); break;
}

if (keyboard_check_pressed(ord("R"))) {
	with (par_player) {
		remaining_movement = moving_speed;
		attacked = false;
	}
	if (instance_number(par_enemy) > 0) {
		global.state = states.ai_turn;
	}
}
