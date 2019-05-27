row = 0;

mp_grid_clear_rectangle(global.map_grid, 0, 0, display_get_width(), display_get_height())

with (par_player) {
	if (self.id != global.selected.id) {
		//mp_grid_add_cell(global.map_grid, round(x/32)-2, round(y/32)-4);
		mp_grid_add_rectangle(global.map_grid, x, y, x, y);
	}
}

with (par_enemy) {
	mp_grid_add_rectangle(global.map_grid, x, y, x, y);
}

for (i = 0; i < 31; i += 1) {
	var i_x;
	i_x = 32 + 32 * i
	
	if (mp_grid_path(global.map_grid, global.navigate, global.selected.x, global.selected.y, i_x, row, 1)) {
		if (path_get_length(global.navigate) <= global.selected.remaining_movement) {
			instance_create_layer(i_x, row, layer, obj_moveSquare);
		} 
		// else mp_grid_add_rectangle(global.map_grid, i_x, row, i_x, row);
	} 
	// else mp_grid_add_rectangle(global.map_grid, i_x, row, i_x, row);
	if (i == 30) {
		i = 0;
		row += 32;
	}
	if (row > 19 * 32) {
		row = 0;
		break;
	}
	
}