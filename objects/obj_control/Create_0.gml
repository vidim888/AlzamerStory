/// global variables.
global.state = states.p_turn;
global.selected = noone;
global.active_skill = noone;

global.ai_selected = noone;

global.moving = false;
global.attacking = false;

global.enemy = noone;

global.damage_dealt = 0;

global.initiative_order = ds_grid_create(2, 100);  // Cleaning it out in Clean Up event!
global.initiative_index = 0;
repeat(100) {
	ds_grid_set(global.initiative_order, 0, global.initiative_index++, -10000);
}

global.starting_height = 1080;
global.starting_width = 1900;

camera_set_view_size(view_camera[0], display_get_width(), display_get_height())

view_set_wport(0, display_get_width());
view_set_hport(0, display_get_height());

randomize();
