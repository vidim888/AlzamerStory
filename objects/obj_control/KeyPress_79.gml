if window_get_fullscreen()
{
	window_set_fullscreen(false);
	alarm_set(0, 1);
}
else
{
	window_set_fullscreen(true);
	alarm_set(1, 1);
}