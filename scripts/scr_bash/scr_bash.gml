/// Bash skill
global.enemy = instance_position(mouse_x, mouse_y, par_enemy);
attacked = true;

if (sprite_index != melee_anim) {
	if (global.enemy.x < x) { image_xscale = -1 }
	sprite_index = melee_anim;
	image_index = 0;
}

if (image_index >= image_number - 1) {
	sprite_index = idle_anim;
	
	to_hit = weapon.base_hit + hit_bonus - global.enemy.dodge - global.active_skill.penalty_to_hit;
	if (irandom_range(1, 100) < to_hit) {
		global.damage_dealt = max(global.active_skill.damage_multiplier * (irandom_range(1, weapon.damage_die) - global.enemy.defence), 2);
		global.enemy.hp -= global.damage_dealt;
	} else {
		global.damage_dealt = "MISS";
	}
	instance_create_layer(global.enemy.x, global.enemy.y, "Actions_Layer", obj_damageDealt);
	if (global.enemy.hp <= 0) {
		instance_destroy(global.enemy);
	}
	
	global.enemy = noone;
	image_xscale = 1;
	
	with (obj_moveSquare) instance_destroy();
	with (obj_attackSquare) instance_destroy();
	with (obj_skillSquare) instance_destroy();
	global.active_skill = noone;
	global.selected = noone;
}

