extends Node2D

var hold_pos

var touch_vector = Vector2()
var primary_touch = false

func _ready():
	pass
func _process(delta):
	pass

func _input(event):
	var zoom = $Camera2D.get_zoom()
	if Input.is_action_just_pressed("mouse1"):
		hold_pos = get_global_mouse_position()
		$TileManager.attempt_selection()
	if Input.is_action_pressed("mouse1"):
		var offset = Vector2(hold_pos.x - get_global_mouse_position().x, hold_pos.y - get_global_mouse_position().y)
		$Camera2D.translate(offset)
	if Input.is_action_pressed("zoom_out"):
#		print("wheel up (event)")
#		zoom[0] = zoom[0] + 0.25
#		zoom[1] = zoom[1] + 0.25
#		$Camera2D.set_zoom(zoom)
		$Camera2D.zoom_at_mouse(1.1)
	if Input.is_action_pressed("zoom_in"):
		if(zoom[0] - 0.25 > 0 && zoom[1] - 0.25 > 0):
#			zoom[0] = zoom[0] - 0.25
#			zoom[1] = zoom[1] - 0.25
#			$Camera2D.set_zoom(zoom)
			$Camera2D.zoom_at_mouse(1/1.1)
	if event is InputEventScreenDrag:
		set_position(get_position() - event.get_relative())
		
