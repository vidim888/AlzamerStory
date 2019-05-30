if (!ds_map_exists(effects_map, "shieldUp")) {
	defence += VIT;
	ds_map_add(effects_map, "shieldUp", 1);
	with (obj_skillSquare) { instance_destroy(); }
	global.selected = noone;
}