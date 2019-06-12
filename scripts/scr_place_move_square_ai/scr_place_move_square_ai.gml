row = 0;

mp_grid_clear_rectangle(global.map_grid, 0, 0, display_get_width(), display_get_height())

with (par_player) {
	if (self.id != global.ai_selected.id) {
		//mp_grid_add_cell(global.map_grid, round(x/32)-2, round(y/32)-4);
		mp_grid_add_rectangle(global.map_grid, x, y, x, y);
	}
}

with (par_enemy) {
	if (self.id != global.ai_selected.id) {
		mp_grid_add_rectangle(global.map_grid, x, y, x, y);
	}
}

for (column = 0; column <= global.grid_width; column++) {
	cell_x = column * global.cell_size;
	cell_y = row * global.cell_size;
	
	if (mp_grid_path(global.map_grid, global.navigate, global.ai_selected.x, global.ai_selected.y, cell_x, cell_y, 1)) {
		if (path_get_length(global.navigate) <= global.ai_selected.remaining_movement) {
			instance_create_layer(cell_x, cell_y, layer, obj_moveSquareAi);
		} 
	} 
	if (column >= global.grid_width) {
		column = 0;
		row++;
	}
	if (row > global.grid_height) {
		row = 0;
		break;
	}
	
}