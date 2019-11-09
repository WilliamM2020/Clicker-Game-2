extends Node

const tile_offset = Vector2(0,0)

var tiles #array of vector2 coordinates which store where tiles are placed
var attraction_pos #array of vector2 coordinates which store where attractions are placed
var attractions #corresponds to attractions array and stores all the attractions

func set_tile(var id, var position):
	$TileMap.set_cellv(position, id)
	
func get_adjacent_tiles(var position):
	var tiles = [position+Vector2(0,1),position+Vector2(0,-1),position+Vector2(1,0),position+Vector2(-1,0),position+Vector2(-1,1),position+Vector2(-1,-1)]
	return tiles
	
func set_attraction(var attraction, var position):
	attraction.position = $TileMap.map_to_world(position) + tile_offset
