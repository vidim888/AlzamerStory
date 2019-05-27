///Displays the damage and destroys itself
alpha += 0.01;
y_pos += 2;

draw_text_color(x - 8, y - 10 - y_pos, global.damage_dealt, 0, 0, 0, 0, 1 - alpha);

if (alpha = 1) {
	instance_destroy();
}
