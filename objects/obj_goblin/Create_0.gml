level = 0.5;

STR = 2;
DEX = 6;
VIT = 3;
INT = 2;

hp = max(floor(2 * VIT * level), 1);

defence = max(floor(VIT / 5), 0);
dodge = floor(DEX + VIT / 3);
initiative_bonus = floor((DEX - 10) / 2);

dmg_bonus = floor(STR / 2);
hit_bonus = floor(DEX / 2 + STR / 3);

weapon = obj_dagger;
instance_create_layer(0, 0, "Actions_Layer", weapon);

image_xscale = -1;

attacked = false;
moved = false;
acquired_targets = false;

pace = 4;

moving_speed = 200;
remaining_movement = moving_speed;

idle_anim = spr_goblin;
run_anim = spr_goblin;
melee_anim = spr_goblin;
death_anim = spr_goblin;
