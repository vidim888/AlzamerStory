if (device_mouse_x_to_gui(0) >= x - sprite_width / 2 && device_mouse_x_to_gui(0) <= x + sprite_width / 2 && device_mouse_y_to_gui(0) >= y - sprite_height && device_mouse_y_to_gui(0) <= y) {
	if (global.selected != noone && global.selected.attacked == false) {
		with (obj_attackSquare) { instance_destroy(); }
		with (obj_moveSquare) { instance_destroy(); }
		global.active_skill = self;
		with (par_enemy) {
			if (distance_to_object(global.selected) <= global.active_skill.range * 128) {
				instance_create_layer(x, y, "Actions_Layer", obj_skillSquare);
			}
		}
	}
}