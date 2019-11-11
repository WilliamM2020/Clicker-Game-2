extends CanvasLayer

var menu = preload("res://scenes/gui/Menu.tscn")
var hud = preload("res://scenes/gui/HUD.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD.connect("menu_button_pressed",self,"_on_Menu_Button_pressed")

func _on_Menu_Button_pressed():
	$HUD.queue_free()
	var menu_scene = menu.instance()
	add_child(menu_scene)
	menu_scene.set_name("Menu")
	$Menu.connect("exit_menu",self,"_on_Exit_pressed")

func _on_Exit_pressed():
	$Menu.queue_free()
	var hud_scene = hud.instance()
	add_child(hud_scene)
	hud_scene.set_name("HUD")
	$HUD.connect("menu_button_pressed",self,"_on_Menu_Button_pressed")
