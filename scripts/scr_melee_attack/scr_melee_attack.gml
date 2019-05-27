if (sprite_index != melee_anim) {
	if (global.enemy.x < x) { image_xscale = -1 }
	sprite_index = melee_anim;
	image_index = 0;
}

if (image_index >= image_number - 1) {
	sprite_index = idle_anim;
	
	global.damage_dealt = irandom_range(attack * 0.8, attack * 1.2);
	global.enemy.hp -= global.damage_dealt;
	instance_create_layer(global.enemy.x, global.enemy.y, layer, obj_damageDealt);
	if (global.enemy.hp <= 0) {
		global.enemy.image_index = 0;
		global.enemy.sprite_index = global.enemy.death_anim;
	}
	
	global.attacking = false;
	global.enemy = noone;
	image_xscale = 1;
}
