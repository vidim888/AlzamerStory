global.enemy = instance_position(mouse_x, mouse_y, par_enemy);
attacked = true;

to_hit = global.active_skill.base_hit + INT - global.enemy.dodge - global.enemy.DEX;
if (irandom_range(1, 100) < to_hit) {
	global.damage_dealt = max(floor(INT / 5), 1) * irandom_range(1, 8);
	global.enemy.hp -= global.damage_dealt;
} else {
	global.damage_dealt = "MISS";
}

instance_create_layer(global.enemy.x, global.enemy.y, "Actions_Layer", obj_damageDealt);
if (global.enemy.hp <= 0) {
	instance_destroy(global.enemy);
}
	
global.enemy = noone;
with (obj_moveSquare) instance_destroy();
with (obj_attackSquare) instance_destroy();
with (obj_skillSquare) instance_destroy();
global.active_skill = noone;
global.selected = noone;
