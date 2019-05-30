if (sprite_index == ranged_anim) {
	if (image_index >= image_number - 1) {
		instance_create_layer(x + 5, y, layer, my_projectile);
		sprite_index = idle_anim;
		image_index = 0;
	}
}

with (my_projectile) {
	image_angle = direction;
	move_towards_point(global.enemy.x, global.enemy.y, 15);
	if (instance_place(x, y, global.enemy)) {
		
		to_hit = global.selected.weapon.base_hit + global.selected.hit_bonus - global.enemy.dodge;
		if (irandom_range(1, 100) < to_hit) {
			global.damage_dealt = max(irandom_range(1, global.selected.weapon.damage_die) - global.enemy.defence, 1);
			global.enemy.hp -= global.damage_dealt;
		} else {
			global.damage_dealt = "MISS";
		}
		
		global.damage_dealt = irandom(global.selected.attack);
		global.enemy.hp -= global.damage_dealt;
		instance_create_layer(global.enemy.x, global.enemy.y, "Actions_Layer", obj_damageDealt)
		if (global.enemy.hp <= 0) {
			instance_deactivate_all(global.enemy);
		}
		global.attacking = false;
		global.selected.image_xscale = 1;
		global.enemy = noone;
		instance_destroy();
	}
}
