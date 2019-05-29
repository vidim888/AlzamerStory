show_debug_message("R PRESSED _______________________________");
with (par_player) {
	remaining_movement = moving_speed;
	attacked = false;
}
if (instance_number(par_player) > 0 && global.selected != noone) {
	global.initiative_index++;
	global.selected = noone;
	global.ai_selected = noone;
	//global.state = states.ai_turn;
	with (obj_moveSquare) instance_destroy();
	with (obj_attackSquare) instance_destroy();
}
