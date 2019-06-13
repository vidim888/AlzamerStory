global.enemy = instance_position(mouse_x, mouse_y, par_player);
attacked = true;

global.damage_dealt = -(irandom_range(1, 8) + INT);
show_debug_message("Healing player for " + string(global.damage_dealt));
global.enemy.hp -= global.damage_dealt;

instance_create_layer(global.enemy.x, global.enemy.y, "Actions_Layer", obj_damageDealt);

global.enemy = noone;
with (obj_moveSquare) instance_destroy();
with (obj_attackSquare) instance_destroy();
with (obj_skillSquare) instance_destroy();
global.active_skill = noone;
global.selected = noone;
