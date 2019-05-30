if (sprite_index != melee_anim) {
	if (global.enemy.x < x) { image_xscale = -1 }
	sprite_index = melee_anim;
	image_index = 0;
}

if (image_index >= image_number - 1) {
	sprite_index = idle_anim;
	
	to_hit = weapon.base_hit + hit_bonus - global.enemy.dodge;
	if (irandom_range(1, 100) < to_hit) {
		global.damage_dealt = max(irandom_range(1, weapon.damage_die) - global.enemy.defence, 1);
		global.enemy.hp -= global.damage_dealt;
	} else {
		global.damage_dealt = "MISS";
	}
	instance_create_layer(global.enemy.x, global.enemy.y, "Actions_Layer", obj_damageDealt);
	if (global.enemy.hp <= 0) {
		instance_destroy(global.enemy);
	}
	
	global.attacking = false;
	global.enemy = noone;
	image_xscale = 1;
	
	with (obj_moveSquare) instance_destroy();
	with (obj_attackSquare) instance_destroy();
	global.selected = noone;
}
