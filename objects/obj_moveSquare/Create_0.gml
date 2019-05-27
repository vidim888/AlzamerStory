/// Create the attack squares

if (global.selected.attacked == false) {
	for (x_off = -32; x_off <= 32; x_off += 32) {
		for (y_off = -32; y_off <= 32; y_off += 32) {
			if (!(x_off == 0 && y_off == 0)) {
				if (instance_position(x + x_off, y + y_off, par_enemy)) {
					if (!instance_position(x + x_off, y + y_off, obj_attackSquare)) {
						instance_create_layer(x + x_off, y + y_off, layer, obj_attackSquare)
					}
				}
			}
		}
	}
}