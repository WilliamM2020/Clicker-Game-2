extends Node

const tile_offset = Vector2(32,34)
var selected_tile

var tiles #array of vector2 coordinates which store where tiles are placed
var attraction_pos #array of vector2 coordinates which store where attractions are placed
var attractions #corresponds to attractions array and stores all the attractions

var surround_tiles #array of tiles that surround currently placed tiles

func set_tile(var id, var position):
	$TileMap.set_cellv(position, id)
	
func get_tile_id(var position):
	return $TileMap.get_cellv(position)
	
func get_adjacent_tiles(var position):
	var tiles = [position+Vector2(0,1),position+Vector2(0,-1),position+Vector2(1,0),position+Vector2(-1,0),position+Vector2(-1,1),position+Vector2(-1,-1)]
	return tiles
	
func set_attraction(var attraction, var position):
	attraction.position = $TileMap.map_to_world(position) + tile_offset
	
func attempt_selection():
	var tile = $TileMap.world_to_map($TileMap.get_local_mouse_position())
	select_tile(tile)
	
func select_tile(var position):
	if get_tile_id(position) != TileMap.INVALID_CELL: #or position in surround_tiles:
		selected_tile = position
		$TileMap/SelectionHex.position = $TileMap.map_to_world(position) + tile_offset
		$TileMap/SelectionHex.show()
	else:
		selected_tile = null
		$TileMap/SelectionHex.hide()