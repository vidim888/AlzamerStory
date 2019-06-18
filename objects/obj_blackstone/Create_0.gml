level = 1;

STR = 9;
DEX = 4;
VIT = 8;
INT = 4;

weapon = obj_glaive;

skill_list = [obj_bash];
reactions = [obj_opportunityAttack, obj_enterOpportunityAttack];

effects_map = ds_map_create();

moving_speed = 500;
pace = 11;

idle_anim = spr_blackstone;
run_anim = spr_blackstone;
melee_anim = spr_blackstone;
death_anim = spr_blackstone;

event_inherited();
