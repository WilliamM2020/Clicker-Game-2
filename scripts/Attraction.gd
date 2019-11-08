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

func _init(var id, var level):
	cost = $GlobalVariables.ATTRACTION_COST_SCALING^id
	production = cost*$GlobalVariables.LEVEL_ONE_PRODUCTION*($GlobalVariables.UPGRADE_PRODUCTION_SCALING^(level-1))
	upgradecost = production * $GlobalVariables.UPGRADE_COST_SCALING
	fame_requirements = cost*$GlobalVariables.FAME_REQUIREMENT
	fame = $GlobalVariables.FAME_INCREASE*cost*level
	
	
