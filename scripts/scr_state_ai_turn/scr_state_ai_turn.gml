if (!instance_exists(par_player)) {
	global.state = states.fail_state;
	return;
}
nearest_target = instance_nearest(x, y, par_player);
nearest_move = instance_nearest(nearest_target.x, nearest_target.y, obj_moveSquareAi);
nearest_attack = instance_nearest(x, y, obj_attackSquareAi);

//show_debug_message(string(nearest_target) + " " + string(nearest_move) + " " + string(nearest_attack));

if (weapon.type == 1) {
	if (moved == false && nearest_move) {
		sprite_index = run_anim;
		scr_navigation(x, y, round(nearest_move.x / global.cell_size) * global.cell_size, round(nearest_move.y / global.cell_size) * global.cell_size, pace);
	} else {moved = true;}
	if (path_index == -1 || moved == true) {
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
		with (obj_moveSquareAi) { instance_destroy(); }
		with (obj_attackSquareAi) { instance_destroy(); }
		if (attacked == true && moved == true) {
			global.enemy = noone;
			global.ai_selected = noone;
			global.initiative_index++;
		}
				
	}
} else if (weapon.type == 2) {
	if (distance_to_object(nearest_target) <= range) {
		instance_create_layer(nearest_target.x, nearest_target.y, layer, obj_attackSquareAi);
		acquired_targets = true;
	}
	if (acquired_targets == true) {
		global.enemy = instance_nearest(nearest_target.x, nearest_target.y, par_player);
		sprite_index = ranged_anim;
		moved = true;
		scr_ranged_attack_ai();
	} else {
		sprite_index = run_anim;
		scr_navigation(x, y, round(nearest_move.x/global.cell_size)*global.cell_size, round(nearest_move.y/global.cell_size)*global.cell_size, pace);
	}
	if (path_index == -1) {
		if (moved == false) {
			sprite_index = idle_anim;
		}
		moved = true;
			
		if (attacked == false && moved == true) {
			if (distance_to_object(nearest_target) <= range) {
				instance_create_layer(nearest_target.x, nearest_target.y, layer, obj_attackSquareAi);
				global.enemy = instance_nearest(nearest_target.x, nearest_target.y, par_player);
				sprite_index = ranged_anim;
				scr_ranged_attack_ai();
			}
		}
		if (attacked == true && moved == true) {
			with (obj_moveSquareAi) { instance_destroy(); }
			with (obj_attackSquareAi) { instance_destroy(); }
			global.enemy = noone;
			global.ai_selected = noone;
			global.initiative_index++;
		}
	}
}
