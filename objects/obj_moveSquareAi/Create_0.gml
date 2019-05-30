/// Create the attack squares AI

if (global.ai_selected.attacked == false) {
	for (x_off = -1; x_off <= 1; x_off += 1) {
		for (y_off = -1; y_off <= 1; y_off += 1) {
			if (!(x_off == 0 && y_off == 0)) {
				if (instance_position(x + x_off * 32, y + y_off * 32, par_player)) {
					if (!instance_position(x + x_off * 32, y + y_off * 32, obj_attackSquareAi)) {
						instance_create_layer(x + x_off * 32, y + y_off * 32, layer, obj_attackSquareAi)
					}
				}
			}
		}
	}
}