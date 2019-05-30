if (global.selected != noone && global.selected.attacked == false) {
	with (obj_attackSquare) { instance_destroy(); }
	with (obj_moveSquare) { instance_destroy(); }
	instance_create_layer(global.selected.x, global.selected.y, "Actions_Layer", obj_skillSquare);
	global.active_skill = self;
}