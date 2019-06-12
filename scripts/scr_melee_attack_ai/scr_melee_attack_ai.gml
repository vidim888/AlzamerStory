if (sprite_index != melee_anim) {
	if (global.enemy.x > x) { image_xscale = 1; }
	sprite_index = melee_anim;
	image_index = 0;
}

if (image_index >= image_number - 1) {
	
	sprite_index = idle_anim;
	
	to_hit = weapon.base_hit + hit_bonus - global.enemy.dodge;
	if (irandom_range(1, 100) < to_hit) {
		global.damage_dealt = max(irandom_range(1, weapon.damage_die) - global.enemy.defence, 1);
		global.enemy.hp -= global.damage_dealt;
		show_debug_message("Player was damaged for " + string(global.damage_dealt));
	} else {
		global.damage_dealt = "MISS";
		show_debug_message("Player dodged the attack");
	}

	instance_create_layer(global.enemy.x, global.enemy.y, "Actions_Layer", obj_damageDealt);
	if (global.enemy.hp <= 0) {
		instance_deactivate_all(global.enemy);
	}
	
	global.attacking = false;
	image_xscale = -1;
	
	with (obj_attackSquareAi) {
		instance_destroy();
	}
	global.enemy = noone;
	attacked = true;
	if (instance_number(par_player) < 1) { global.state = states.fail_state; }
	
}
