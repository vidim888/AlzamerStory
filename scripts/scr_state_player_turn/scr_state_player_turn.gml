if (mouse_check_button_pressed(mb_left)) {
	if (instance_position(mouse_x, mouse_y, obj_moveSquare)) {
		global.moving = true;
		with (obj_moveSquare) instance_destroy();
		with (obj_attackSquare) instance_destroy();
		sprite_index = run_anim;
		scr_navigation(x, y, round(mouse_x/32)*32, round(mouse_y/32)*32, pace);
		remaining_movement -= path_get_length(global.navigate);
	} else if (instance_position(mouse_x, mouse_y, obj_attackSquare) && global.selected.attacked == false) {
		global.enemy = instance_position(mouse_x, mouse_y, par_enemy);
		global.attacking = true;
		attacked = true;
		if (weapon.type == 1) {
			if (distance_to_object(global.enemy) > 13) {
				global.moving = true;
				scr_calculate_dist();
				sprite_index = run_anim;
				scr_navigation(x, y, round(global.attack_travel_x / 32) * 32, round(global.attack_travel_y / 32) * 32, pace);
				remaining_movement -= path_get_length(global.navigate);
			}
		} else if (weapon.type == 2) {
			if (global.enemy.x < x) { image_xscale = -1; }
			sprite_index = ranged_anim;
			image_index = 0;
		}
	} else if (instance_position(mouse_x, mouse_y, obj_skillSquare)) {
		scr_skillChooser(global.active_skill.skill_name);
	}
} else if (mouse_check_button_pressed(mb_right)) {
	if (instance_exists(obj_skillSquare)) {
		with (obj_skillSquare) {
			instance_destroy();
		}
	}
	global.selected = noone;
}


if (global.moving == true) {
	if (path_index == -1) {
		if (global.attacking == false) {
			with (obj_moveSquare) instance_destroy();
			with (obj_attackSquare) instance_destroy();
			global.selected = noone;
			sprite_index = idle_anim;
		}
		global.moving = false;
	}
}

if (global.attacking == true) {
	if (global.moving == false) {
		if (weapon.type == 1) scr_melee_attack();
		if (weapon.type == 2) scr_ranged_attack();
	}
}
