if (window_scale < 4) {
	window_scale *= 2;
	camera_set_view_size(view_camera[0], display_get_width() / window_scale, display_get_height() / window_scale);
}