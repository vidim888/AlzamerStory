//if (global.moving == false && global.attacking == false) {
//	if (instance_position(mouse_x, mouse_y, par_player) && mouse_check_button_pressed(mb_left)) {
//		var player;
//		player = instance_nearest(mouse_x, mouse_y, par_player);
	
//		global.selected = player;
	
//		with (obj_moveSquare) instance_destroy();
//		with (obj_attackSquare) instance_destroy();
	
//		if (player.type == 2) {
//			if (player.attacked == false) {
//				with (par_enemy) {
//					if (distance_to_object(global.selected) <= player.range) {
//						instance_create_layer(x, y, layer, obj_attackSquare);
//					}
//				}
//			}
//		}
//		scr_place_move_square();
//	} else if (!instance_position(mouse_x, mouse_y, par_player) && mouse_check_button_pressed(mb_left)) {
//		global.selected = noone;
//		with (obj_moveSquare) instance_destroy();
//		with (obj_attackSquare) instance_destroy();
//	}
//}

if (mouse_check_button_pressed(mb_left)) {
	if (instance_position(mouse_x, mouse_y, obj_moveSquare)) {
		global.moving = true;
		with (obj_moveSquare) instance_destroy();
		with (obj_attackSquare) instance_destroy();
		//with (global.selected) {
			sprite_index = run_anim;
			scr_navigation(x, y, round(mouse_x/32)*32, round(mouse_y/32)*32, pace);
			remaining_movement -= path_get_length(global.navigate);
		//}
	} else if (instance_position(mouse_x, mouse_y, obj_attackSquare) && global.selected.attacked == false) {
		global.enemy = instance_position(mouse_x, mouse_y, par_enemy);
		global.attacking = true;
		//with (global.selected) {
			attacked = true;
			if (type == 1) {
				if (distance_to_object(global.enemy) > 13) {
					global.moving = true;
					scr_calculate_dist();
					sprite_index = run_anim;
					scr_navigation(x, y, round(global.attack_travel_x / 32) * 32, round(global.attack_travel_y / 32) * 32, pace);
					remaining_movement -= path_get_length(global.navigate);
				}
			} else if (type == 2) {
				if (global.enemy.x < x) { image_xscale = -1; }
				sprite_index = ranged_anim;
				image_index = 0;
			}
		//}
	}
}


if (global.moving == true) {
	show_debug_message("It's moving");
	show_debug_message(path_index);
	//with (global.selected) {
		if (path_index == -1) {
			show_debug_message("It should stop moving");
			if (global.attacking == false) {
				with (obj_moveSquare) instance_destroy();
				with (obj_attackSquare) instance_destroy();
				global.selected = noone;
				sprite_index = idle_anim;
			}
			global.moving = false;
		}
	//}
}

if (global.attacking == true) {
	if (global.moving == false) {
		//with (global.selected) {
			if (type == 1) scr_melee_attack();
			if (type == 2) scr_ranged_attack();
			
		//}
	}
}
