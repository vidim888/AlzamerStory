global.enemy = instance_position(mouse_x, mouse_y, par_player);
with (global.enemy) {
	if (!ds_map_exists(effects_map, "attackUp")) {
		dmg_bonus += global.active_skill.dmg_bonus;
		ds_map_add(effects_map, "attackUp", 2);
		with (obj_skillSquare) { instance_destroy(); }
		global.selected = noone;
	}
}