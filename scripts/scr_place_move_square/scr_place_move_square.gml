row = 0;

mp_grid_clear_rectangle(global.map_grid, 0, 0, display_get_width(), display_get_height())

with (par_player) {
	if (self.id != global.selected.id) {
		mp_grid_add_rectangle(global.map_grid, x, y, x, y);
	}
}

with (par_enemy) {
	mp_grid_add_rectangle(global.map_grid, x, y, x, y);
}

for (column = 0; column <= global.grid_width; column++) {
	cell_x = column * global.cell_size;
	cell_y = row * global.cell_size;
	
	if (mp_grid_path(global.map_grid, global.navigate, global.selected.x, global.selected.y, cell_x, cell_y, 1)) {
		if (path_get_length(global.navigate) <= global.selected.remaining_movement) {
			instance_create_layer(cell_x, cell_y, layer, obj_moveSquare);
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