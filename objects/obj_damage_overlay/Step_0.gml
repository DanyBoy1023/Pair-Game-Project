if fading_in
{
	image_alpha = lerp(image_alpha, target_alpha, .2)
	if image_alpha >= target_alpha - margin
	{
		fading_in = false
	}
}
else
{
	image_alpha = lerp(image_alpha, 0, .2)
}

if keyboard_check(ord("D"))
{
	flash_overlay()
}