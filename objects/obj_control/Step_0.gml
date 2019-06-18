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

if (ds_grid_get(global.initiative_order, 0, global.initiative_index) == -10000) {
	ds_grid_set(global.initiative_order, 0, 0, -10000);
} else if (instance_exists(ds_grid_get(global.initiative_order, 1, global.initiative_index))) {
	with (ds_grid_get(global.initiative_order, 1, global.initiative_index)) {
		if (object_is_ancestor(object_index, par_player)) {
			if (global.moving == false && global.attacking == false && global.selected == noone) {
				global.selected = ds_grid_get(global.initiative_order, 1, global.initiative_index);
				if (weapon.type == 2) {
					if (attacked == false) {
						with (par_enemy) {
							if (distance_to_object(global.selected) <= global.selected.range) {
								instance_create_layer(x, y, layer, obj_attackSquare);
							}
						}
					}
				}
				scr_place_move_square();
				for (each_skill = 0; each_skill < array_length_1d(skill_list); each_skill++) {
					instance_create_layer((global.starting_width / 2 - 300) + (global.cell_size * 1.25) * each_skill, global.starting_height - 20, "Actions_Layer", skill_list[each_skill]);
				}
			}
			if (global.selected != noone) {
				scr_state_player_turn();
			}
		} else if (object_is_ancestor(object_index, par_enemy)) {
			if (global.moving == false && global.attacking == false && global.ai_selected == noone) {
				global.ai_selected = ds_grid_get(global.initiative_order, 1, global.initiative_index);
				attacked = false;
				moved = false;
				acquired_targets = false;
				scr_place_move_square_ai();
			}
			if (global.ai_selected != noone) {
				scr_state_ai_turn();
			}
		}
	}
} else {
	global.initiative_index++;
}
