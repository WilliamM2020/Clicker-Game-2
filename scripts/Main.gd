extends Node2D

var hold_pos

func _ready():
	$TileManager.set_tile(1,Vector2(0,0))
	for tile in $TileManager.get_adjacent_tiles(Vector2(0,0)):
		$TileManager.set_tile(2,tile)

func _process(delta):
	get_input()
	
func get_input():
	if Input.is_action_just_pressed("mouse1"):
		hold_pos = get_global_mouse_position()
	if Input.is_action_pressed("mouse1"):
		var offset = Vector2(hold_pos.x - get_global_mouse_position().x, hold_pos.y - get_global_mouse_position().y)
		$Camera2D.translate(offset)
	if Input.is_action_pressed("zoom_in"):
		$Camera2D.set_size($Camera2D.size*1.1)
		print("zoom in")
	if Input.is_action_pressed("zoom_out"):
		$Camera2D.set_size($Camera2D.size*0.9)
		print("zoom out")