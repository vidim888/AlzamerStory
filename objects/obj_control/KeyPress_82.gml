with (par_player) {
	remaining_movement = moving_speed;
	attacked = false;
	var size = ds_map_size(effects_map);
	var key = ds_map_find_first(effects_map);
	for (var i = 0; i < size; i++;) {
		effects_map[? key] -= 1;
		if (effects_map[? key] <= 0) {
			scr_effectEndChooser(key);
		}
	}
}
if (instance_number(par_player) > 0 && global.selected != noone && global.moving == false && global.attacking == false) {
	global.initiative_index++;
	global.selected = noone;
	global.ai_selected = noone;
	with (obj_moveSquare) instance_destroy();
	with (obj_attackSquare) instance_destroy();
	with (obj_skillSquare) instance_destroy();
}
