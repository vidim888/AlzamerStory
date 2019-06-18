if (device_mouse_x_to_gui(0) >= x - sprite_width / 2 && device_mouse_x_to_gui(0) <= x + sprite_width / 2 && device_mouse_y_to_gui(0) >= y - sprite_height && device_mouse_y_to_gui(0) <= y) {
	if (global.selected != noone && global.selected.attacked == false) {
		with (obj_skillSquare) { instance_destroy(); }
		if (global.active_skill == self) {
			global.active_skill = noone;
			global.selected = noone;
		} else {
			with (obj_attackSquare) { instance_destroy(); }
			with (obj_moveSquare) { instance_destroy(); }
			instance_create_layer(global.selected.x, global.selected.y, "Actions_Layer", obj_skillSquare);
			global.active_skill = self;
		}
	}
}