extends Node2D

var hold_pos
var menu = preload("res://scenes/gui/Menu.tscn")
var hud = preload("res://scenes/gui/HUD.tscn")

func _ready():
	$GUI/HUD.connect("menu_button_pressed",self,"_on_Menu_Button_pressed")

func _on_Menu_Button_pressed():
	$GUI/HUD.queue_free()
	var menu_scene = menu.instance()
	$GUI.add_child(menu_scene)
	menu_scene.set_name("Menu")
	$GUI/Menu.connect("exit_menu",self,"_on_Exit_pressed")

func _on_Exit_pressed():
	$GUI/Menu.queue_free()
	var hud_scene = hud.instance()
	$GUI.add_child(hud_scene)
	hud_scene.set_name("HUD")
	$GUI/HUD.connect("menu_button_pressed",self,"_on_Menu_Button_pressed")

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
