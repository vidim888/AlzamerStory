draw_self();
if (drawing_path) {
	draw_set_color(c_red);
	mp_grid_path(global.map_grid, global.navigate, global.selected.x, global.selected.y, x, y, 1);
	draw_path(global.navigate, 0, 0, true);
}