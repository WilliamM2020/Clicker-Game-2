extends Node

class_name GlobalVariables, "res://scripts/autoload/GlobalVariables.gd"
# Scaling of gold revenue

const ATTRACTION_COST_SCALING : float = 100.0 #of next attraction
const DUPLICATE_ATTRACTION_COST_SCALING = 1000 #two of same attraction
const UPGRADE_COST_SCALING = 6000 #seconds of production
const UPGRADE_PRODUCTION_SCALING = 1.5 #of previous level production
const LEVEL_ONE_PRODUCTION = 0.1 #of the cost
const FAME_REQUIREMENT = 0.1 #of the cost
const LEVELS_TO_SPRITE_UPGRADE = 5
const FAME_INCREASE = 0.5 #of the cost

# Tourists pop up

const SECONDS_TO_POPUP_CHANCE = 60 #each 60 seconds is a possibility of pop up
const CHANCE_OF_FAME_POP_UP = 0.1
const CHANCE_OF_GOLD_POP_UP = 0.3
const FAME_POPUP_AMOUNT = 0.05 #of current fame
const GOLD_POPUP_AMOUNT = 30 #seconds of revenue

# Large Events

const OPENING_CEREMONY_BONUS = 10800 #seconds of revenue
const TOURIST_BUS_CHANCE = 0.0025 #every second to have popup

# Premium shop (all costs in gems)

const TIME_SKIP_1H_COST = 100
const TIME_SKIP_6H_COST = 500
const TIME_SKIP_12H_COST = 800

const REVENUE_BOOSTER_4X_1H_COST = 100
const REVENUE_BOOSTER_4X_2H_COST = 150

const AD_TIMER_COOLDOWN = 3600 #seconds until watch again
const AD_REWARD = 100

func _ready():
	print("GlobalVariables is intitalized")
