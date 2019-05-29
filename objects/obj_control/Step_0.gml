/// State Control

if (global.state == states.fail_state) {
	game_end();
}

if (ds_grid_get(global.initiative_order, 0, 0) == -10000) {
	var i = 0;
	global.initiative_index = 0;
	with (par_creature) {
		ds_grid_set(global.initiative_order, 0, i, irandom(19) + self.initiative_bonus);
		ds_grid_set(global.initiative_order, 1, i++, self);
	}
	for (i = i; i < 100; i++) {
		ds_grid_set(global.initiative_order, 0, i, -10000);	
	}
	ds_grid_sort(global.initiative_order, 0, false);
}

if (instance_exists(ds_grid_get(global.initiative_order, 1, global.initiative_index))) {
	with (ds_grid_get(global.initiative_order, 1, global.initiative_index)) {
		if (object_is_ancestor(object_index, par_player)) {
			//global.selected = whose_turn;
			//scr_state_player_turn();
			if (global.moving == false && global.attacking == false && global.selected == noone) {
				show_debug_message("Initialized");
				global.selected = ds_grid_get(global.initiative_order, 1, global.initiative_index);
				if (type == 2) {
					if (attacked == false) {
						with (par_enemy) {
							if (distance_to_object(global.selected) <= global.selected.range) {
								instance_create_layer(x, y, layer, obj_attackSquare);
							}
						}
					}
				}
				scr_place_move_square();
			}
			if (global.selected != noone) {
				scr_state_player_turn();
			}
		} else if (object_is_ancestor(object_index, par_enemy)) {
			if (global.moving == false && global.attacking == false && global.ai_selected == noone) {
				show_debug_message("AI Initialized");
				global.ai_selected = ds_grid_get(global.initiative_order, 1, global.initiative_index);
				attacked = false;
				moved = false;
				acquired_targets = false;
				//if (type == 2) {
				//	//if (attacked == false) {
				//		with (par_player) {
				//			if (distance_to_object(global.ai_selected) <= global.ai_selected.range) {
				//				instance_create_layer(x, y, layer, obj_attackSquareAi);
				//			}
				//		}
				//	//}
				//}
				scr_place_move_square_ai();
			}
			if (global.moving == false && global.attacking == false && global.ai_selected != noone) {
				scr_state_ai_turn();
			}
		}
	}
	//global.initiative_index++;
} else if (ds_grid_get(global.initiative_order, 0, global.initiative_index) == -10000) {
	ds_grid_set(global.initiative_order, 0, 0, -10000);
} else {
	global.initiative_index++;
}


//show_debug_message("Ending!");
//game_end();

//switch(global.state) {
//	case states.p_turn: scr_state_player_turn(); break;
//	case states.ai_turn: scr_state_ai_turn(); break;
//}
