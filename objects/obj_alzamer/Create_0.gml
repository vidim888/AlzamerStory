level = 1;

STR = 8;
DEX = 3;
VIT = 8;
INT = 6;

weapon = obj_sword;

skill_list = [obj_shieldUp, obj_sacredFlame, obj_heal, obj_attackUp];

effects_map = ds_map_create();

moving_speed = 500;
pace = 11;

idle_anim = spr_alzamer;
run_anim = spr_alzamer;
melee_anim = spr_alzamer;
death_anim = spr_alzamer;

event_inherited();