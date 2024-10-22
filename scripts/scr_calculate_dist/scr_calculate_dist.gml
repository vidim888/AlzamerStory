var dist_list = array_create(9, 10000);

var square = instance_nearest(mouse_x, mouse_y, obj_attackSquare);

for (x_off = -1; x_off <= 1; x_off += 1) {
	for (y_off = -1; y_off <= 1; y_off += 1) {
		if (!(x_off == 0 && y_off == 0)) {
			if (instance_position(square.x + x_off * global.cell_size, square.y + y_off * global.cell_size, obj_moveSquare)) {
				dist_list[4 + 3 * x_off + y_off] = point_distance(global.selected.x, global.selected.y, square.x + x_off * global.cell_size, square.y + y_off * global.cell_size);
			}
		}
	}
}

var list_min = 10000;
var ii = -1;

for (i = 0; i <= 8; i += 1) {
	if (dist_list[i] < list_min) {
		ii = i;
		list_min = dist_list[i];
	}
}

if (ii != -1) {
	global.attack_travel_x = square.x + (floor(ii / 3) - 1) * global.cell_size;
	global.attack_travel_y = square.y + (ii - floor(ii / 3) * 3 - 1) * global.cell_size;
}
