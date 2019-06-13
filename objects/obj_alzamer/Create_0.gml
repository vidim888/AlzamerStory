level = 1;

STR = 8;
DEX = 3;
VIT = 8;
INT = 6;

hp = floor(2 * VIT * level) + 100;

defence = max(floor(VIT / 5), 0);
dodge = floor(DEX + VIT / 3);
initiative_bonus = floor((DEX - 10) / 2);

dmg_bonus = floor(STR / 2);
hit_bonus = floor(DEX / 2 + STR / 3);

weapon = obj_sword;
instance_create_layer(0, 0, "Actions_Layer", weapon);

skill_list = [obj_shieldUp, obj_sacredFlame, obj_heal, obj_attackUp];

effects_map = ds_map_create();

attacked = false;

moving_speed = 500;
remaining_movement = moving_speed;
pace = 11;

idle_anim = spr_alzamer;
run_anim = spr_alzamer;
melee_anim = spr_alzamer;
death_anim = spr_alzamer;
