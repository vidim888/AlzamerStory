///Displays the damage and destroys itself
alpha += 0.01;
y_pos += 2;

draw_text_color(x - 8, y - 10 - y_pos, damage, c_red, c_red, c_red, c_red, 1 - alpha);

if (alpha >= 1) {
	instance_destroy();
}
