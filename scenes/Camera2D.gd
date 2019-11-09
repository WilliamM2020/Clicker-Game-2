extends Camera2D

var zoom_step = 1.1

#func _init():
#	limit_left = -10000
#	limit_right = 10000
#	limit_bottom = 10000
#	limit_top = -10000

func zoom_at_point(zoom_change, point):
	var c0 = global_position # camera position
	var v0 = get_viewport().size # vieport size
	var c1 # next camera position
	var z0 = zoom # current zoom value
	var z1 = z0 * zoom_change # next zoom value
	c1 = c0 + (-0.5*v0 + point)*(z0 - z1)
	if z1.x<0.3:
		zoom = Vector2(0.3,0.3)
	elif z1.x>2.3:
		zoom = Vector2(2.3,2.3)
	else:
		zoom = z1
		global_position = c1
