if (display_width > window_width * global.window_scale) {
	global.window_scale += 0.2;
	
	window_set_size(window_width * global.window_scale, window_height * global.window_scale);
	
	if (display_width <= window_width * global.window_scale) {
		window_set_position(0, 0);
	} else if (display_width > window_width * global.window_scale) {
		if (set_position == false) {
			alarm[0] = 1;
			set_position = true;
		}
	}
}