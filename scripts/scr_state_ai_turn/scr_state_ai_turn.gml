if (instance_number(par_player < 1)) {
	global.state = states.fail_state;
}

if (global.ai_selected == noone) {
	if (global.ai_activated == false) {
		ai_active = instance_number(par_enemy) - global.ai_id;
		global.ai_selected = instance_find(par_enemy, ai_active);
		scr_place_move_square_ai();
		global.ai_activated = true;
	}
}

with (global.ai_selected) {
	if (global.ai_activated == true) {
		if (!instance_exists(par_player)) {
			global.state = states.fail_state;
			break;
		}
		nearest_target = instance_nearest(x, y, par_player);
		nearest_move = instance_nearest(nearest_target.x, nearest_target.y, obj_moveSquareAi);
		nearest_attack = instance_nearest(x, y, obj_attackSquareAi);
		
		if (type == 1) {
			if (moved == false) {
				sprite_index = run_anim;
				scr_navigation(x, y, round(nearest_move.x / 32) * 32, round(nearest_move.y / 32) * 32, pace);
				
			}
			if (path_index == -1) {
				if (moved == false) {
					sprite_index = idle_anim;
				}
				moved = true;
				if (instance_exists(obj_attackSquareAi)) {
					global.enemy = instance_position(nearest_attack.x, nearest_attack.y, par_player);
				}
				if (global.enemy != noone) {
					scr_melee_attack_ai();
				} else {
					attacked = true;
				}
				with (obj_moveSquareAi) {
					instance_destroy();
				}
				
				if (attacked == true && moved == true) {
					global.enemy = noone;
					global.ai_id += 1;
					global.ai_selected = noone;
					global.ai_activated = false;
				}
				
			}
		} else if (type == 2) {
			if (acquired_targets == false) {
				with (par_player) {
					if (distance_to_object(global.ai_selected) <= global.ai_selected.range) {
						instance_create_layer(x, y, layer, obj_attackSquareAi);
					}
				}
				nearest_attack = instance_nearest(x, y, obj_attackSquareAi);
				acquired_targets = true;
			}
			if (instance_exists(obj_attackSquareAi)) {
				global.enemy = instance_nearest(nearest_attack.x, nearest_attack.y, par_player);
				sprite_index = ranged_anim;
				moved = true;
				scr_ranged_attack_ai();
			} else if (!instance_exists(obj_attackSquareAi)) {
				attacked = true;
				if (moved == false) {
					sprite_index = run_anim;
					scr_navigation(x, y, round(nearest_move.x/32)*32, round(nearest_move.y/32)*32, pace);
				}
			}
			if (path_index == -1) {
				if (moved == false) {
					sprite_index = idle_anim;
				}
				moved = true;
				with (obj_moveSquareAi) {
					instance_destroy();
				}
				if (attacked == true && moved == true) {
					global.enemy = noone;
					global.ai_id += 1;
					global.ai_selected = noone;
					global.ai_activated = false;
				}
			}
		}
	}
}

if (global.ai_id > instance_number(par_enemy)) {
	global.state = states.p_turn;
	global.ai_selected = noone;
	global.ai_id = 1;
	with (par_enemy) {
		attacked = false;
		moved = false;
		acquired_targets = false;
	}
}
