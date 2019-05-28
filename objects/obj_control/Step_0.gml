/// State Control
switch(global.state) {
	case states.p_turn: scr_state_player_turn(); break;
	case states.ai_turn: scr_state_ai_turn(); break;
}
