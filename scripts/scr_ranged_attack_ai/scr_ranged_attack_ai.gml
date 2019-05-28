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
		global.damage_dealt = irandom(global.ai_selected.attack);
		global.enemy.hp -= global.damage_dealt;
		instance_create_layer(global.enemy.x, global.enemy.y, layer, obj_damageDealt)
		if (global.enemy.hp <= 0) {
			global.enemy.image_index = 0;
			global.enemy.sprite_index = global.enemy.death_anim;
		}
		global.attacking = false;
		global.ai_selected.image_xscale = -1;
		
		with (obj_attackSquareAi) { instance_destroy(); }
		global.enemy = noone;
		attacked = true;
		if (instance_number(par_player) < 1) { global.state = states.fail_state; }
		instance_destroy();
	}
}
