/// Create the attack squares
range = global.selected.weapon.range;
if (global.selected.attacked == false) {
	for (x_off = -range; x_off <= range; x_off += 1) {
		for (y_off = -range; y_off <= range; y_off += 1) {
			if (!(x_off == 0 && y_off == 0)) {
				if (instance_position(x + x_off * global.cell_size, y + y_off * global.cell_size, par_enemy)) {
					if (!instance_position(x + x_off * global.cell_size, y + y_off * global.cell_size, obj_attackSquare)) {
						instance_create_layer(x + x_off * global.cell_size, y + y_off * global.cell_size, layer, obj_attackSquare)
					}
				}
			}
		}
	}
}