extends Node2D

var hold_pos

func _ready():
	var attraction = load("res://scenes/Attraction.tscn")
	var new_attraction = attraction.instance()
	new_attraction.set_name("Attraction")
	add_child(new_attraction)
	$Attraction.position = Vector2(256,190)
	$Attraction.initialize(2,3)

func _process(delta):
	get_input()
	
func get_input():
	if Input.is_action_just_pressed("mouse1"):
		hold_pos = get_global_mouse_position()
	if Input.is_action_pressed("mouse1"):
		var offset = Vector2(hold_pos.x - get_global_mouse_position().x, hold_pos.y - get_global_mouse_position().y)
		$Camera2D.translate(offset)
