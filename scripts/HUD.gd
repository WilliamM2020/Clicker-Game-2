extends VBoxContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal menu_button_pressed
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	emit_signal("menu_button_pressed")
	
	