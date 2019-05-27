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
		global.damage_dealt = irandom(global.selected.attack);
		global.enemy.hp -= global.damage_dealt;
		instance_create_layer(global.enemy.x, global.enemy.y, layer, obj_damageDealt)
		if (global.enemy.hp <= 0) {
			global.enemy.image_index = 0;
			global.enemy.sprite_index = global.enemy.death_anim;
		}
		global.attacking = false;
		global.selected.image_xscale = 1;
		global.enemy = noone;
		instance_destroy();
	}
}
