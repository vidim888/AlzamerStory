/// global variables.
global.state = states.p_turn;
global.selected = noone;
global.active_skill = noone;

global.ai_selected = noone;

global.moving = false;
global.attacking = false;

global.enemy = noone;

global.damage_dealt = 0;

global.initiative_order = ds_grid_create(2, 100);
global.initiative_index = 0;
repeat(100) {
	ds_grid_set(global.initiative_order, 0, global.initiative_index++, -10000);
}
