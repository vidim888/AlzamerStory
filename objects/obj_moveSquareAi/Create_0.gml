/// Create the attack squares AI

if (global.ai_selected.attacked == false) {
	for (x_off = -32; x_off <= 32; x_off += 32) {
		for (y_off = -32; y_off <= 32; y_off += 32) {
			if (!(x_off == 0 && y_off == 0)) {
				if (instance_position(x + x_off, y + y_off, par_player)) {
					if (!instance_position(x + x_off, y + y_off, obj_attackSquareAi)) {
						instance_create_layer(x + x_off, y + y_off, layer, obj_attackSquareAi)
					}
				}
			}
		}
	}
}