///Displays the damage and destroys itself
alpha += 0.01;
y_pos += 2;

draw_set_font(fon_damage);

if (damage == "MISS") {
	draw_text_color(x - 8, y - 10 - y_pos, damage, c_black, c_black, c_black, c_black, 1 - alpha);
} else if (damage > 0) {
	draw_text_color(x - 8, y - 10 - y_pos, damage, c_red, c_red, c_red, c_red, 1 - alpha);
} else if (damage < 0) {
	damage_text = -damage;
	draw_text_color(x - 8, y - 10 - y_pos, damage_text, c_green, c_green, c_green, c_green, 1 - alpha);
}

if (alpha >= 1) {
	instance_destroy();
}
