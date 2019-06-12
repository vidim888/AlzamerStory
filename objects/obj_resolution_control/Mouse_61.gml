if (window_scale > 0.25) {
	window_scale /= 2;
	if (room_width <= display_get_width() / window_scale) {
		camera_set_view_size(view_camera[0], room_width, room_height);
	} else {
	camera_set_view_size(view_camera[0], display_get_width() / window_scale, display_get_height() / window_scale);
	}
}