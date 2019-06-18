if (device_mouse_x_to_gui(0) >= x - sprite_width / 2 && device_mouse_x_to_gui(0) <= x + sprite_width / 2 && device_mouse_y_to_gui(0) >= y - sprite_height && device_mouse_y_to_gui(0) <= y) {
	if (global.selected != noone && global.selected.attacked == false && global.selected.weapon.type == 1) {
		with (obj_skillSquare) { instance_destroy(); }
		if (global.active_skill == self) {
			global.active_skill = noone;
			global.selected = noone;
		} else if (global.active_skill != noone) {
			scr_place_move_square();
			global.active_skill = noone;
		}
		if (global.active_skill == noone) {
			with (obj_attackSquare) {
				instance_create_layer(x, y, layer, obj_skillSquare);
				instance_destroy();
			}
			with (obj_moveSquare) { instance_destroy(); }
			global.active_skill = self;
		}
	}
}