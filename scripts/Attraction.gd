extends Node2D

var id
var level
var production
var cost
var upgradecost
var fame
var fame_requirements

func _ready():
	pass # Replace with function body.

func initialize(var _id, var _level):
	print("yeet")
	id = _id
	cost = pow(GlobalVariables.ATTRACTION_COST_SCALING, float(id))
	set_level(_level)
	$Sprite.set_region_rect(Rect2((level-1)*64,(id-1)*64,64,64))
	
func set_level(_level):
	level = _level
	production = cost*GlobalVariables.LEVEL_ONE_PRODUCTION*(pow(GlobalVariables.UPGRADE_PRODUCTION_SCALING,float((level-1))))
	upgradecost = production * GlobalVariables.UPGRADE_COST_SCALING
	fame_requirements = cost*GlobalVariables.FAME_REQUIREMENT
	fame = GlobalVariables.FAME_INCREASE*cost*level
	set_sprite()
	
func increase_level():
	set_level(level + 1)
	
func set_sprite(): #set the attraction sprite based on the level
	if level % GlobalVariables.LEVELS_TO_SPRITE_UPGRADE == 0:
		$Sprite.set_region_rect(Rect2((level-1)*64,(id-1)*64,64,64))