hp = max(floor(2 * VIT * level), 1);

defence = max(floor(VIT / 5), 0);
dodge = floor(DEX + VIT / 3);
initiative_bonus = floor((DEX - 10) / 2);

dmg_bonus = floor(STR / 2);
hit_bonus = floor(DEX / 2 + STR / 3);

instance_create_layer(0, 0, "Actions_Layer", weapon);

remaining_movement = moving_speed;

image_xscale = -1;

attacked = false;
reacted = false;
