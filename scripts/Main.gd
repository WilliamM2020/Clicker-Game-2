extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var attraction = load("res://scenes/Attraction.tscn")
	var new_attraction = attraction.instance()
	new_attraction.set_name("Attraction")
	add_child(new_attraction)
	$Attraction.position = Vector2(256,190)
	$Attraction.initialize(2,3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
