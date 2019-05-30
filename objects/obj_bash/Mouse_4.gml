if (global.selected != noone && global.selected.attacked == false) {
	with (obj_attackSquare) {
		if (distance_to_object(global.selected) > 13) {
			instance_destroy();
		} else {
			instance_create_layer(x, y, layer, obj_skillSquare);
			instance_destroy();
		}
	}
	with (obj_moveSquare) { instance_destroy(); }
	global.active_skill = self;
}