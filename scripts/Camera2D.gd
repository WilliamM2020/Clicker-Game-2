extends Camera2D

#func _init():
#	limit_left = -10000
#	limit_right = 10000
#	limit_bottom = 10000
#	limit_top = -10000

func zoom_at_mouse(zoom_change):
	var c0 = global_position # camera position
	var z0 = zoom # current zoom value
	var z1 = z0 * zoom_change # next zoom value
	if z1.x<0.3:
		zoom = Vector2(0.3,0.3)
	elif z1.x>2.3:
		zoom = Vector2(2.3,2.3)
	else:
		zoom = z1
		position = (c0 - get_global_mouse_position()) * z0 / z1 + get_global_mouse_position()
