extends Node

class_name Math, "res://scripts/autoload/Math.gd"
func _ready():
	pass # Replace with function body.

static func signpoint(var  p1, var  p2, var p3):
    return (p1.x - p3.x) * (p2.y - p3.y) - (p2.x - p3.x) * (p1.y - p3.y)

static func point_in_traingle(var pt, var v1, var v2, var v3):
	var d1 = signpoint(pt, v1, v2)
	var d2 = signpoint(pt, v2, v3)
	var d3 = signpoint(pt, v3, v1)
	var has_neg = (d1 < 0) || (d2 < 0) || (d3 < 0)
	var has_pos = (d1 > 0) || (d2 > 0) || (d3 > 0)
	return !(has_neg && has_pos)
