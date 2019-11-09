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
	var tiles
	if int(position.y)%2==0:
		print("even y")
		tiles = [position+Vector2(0,1),position+Vector2(0,-1),position+Vector2(1,0),position+Vector2(-1,0),position+Vector2(-1,1),position+Vector2(-1,-1)]
	else:
		print("even y")
		tiles = [position+Vector2(0,1),position+Vector2(0,-1),position+Vector2(1,0),position+Vector2(-1,0),position+Vector2(1,-1),position+Vector2(1,1)]
	return tiles
	
func set_attraction(var attraction, var position):
	attraction.position = $TileMap.map_to_world(position) + tile_offset
	
func attempt_selection():
	var pos = $TileMap.get_local_mouse_position()
	var tile = $TileMap.world_to_map(pos)
	var tile_pos = $TileMap.map_to_world(tile)
	if point_in_traingle(pos, tile_pos, tile_pos + Vector2(32,0), tile_pos + Vector2(0,16)):
		if int(tile.y) % 2 == 0:
			select_tile(tile + Vector2(-1,-1))
		else:
			select_tile(tile + Vector2(0,-1))
		#set_base_hex(tile)
		return
	if point_in_traingle(pos, tile_pos + Vector2(32,0), tile_pos + Vector2(64,0), tile_pos + Vector2(64,16)):
		if int(tile.y) % 2 == 0:
			select_tile(tile + Vector2(0,-1))
		else:
			select_tile(tile + Vector2(1,-1))
		#set_base_hex(tile)
		return
	select_tile(tile)
	#$TileMap/BaseHex.hide()
	
func select_tile(var position):
	if get_tile_id(position) != TileMap.INVALID_CELL: #or position in surround_tiles:
		selected_tile = position
		$TileMap/SelectionHex.position = $TileMap.map_to_world(position) + tile_offset
		$TileMap/SelectionHex.show()
	else:
		selected_tile = null
		$TileMap/SelectionHex.hide()

func set_base_hex(var position):
	$TileMap/BaseHex.position = $TileMap.map_to_world(position) + tile_offset
	$TileMap/BaseHex.show()

func signpoint(var  p1, var  p2, var p3):
    return (p1.x - p3.x) * (p2.y - p3.y) - (p2.x - p3.x) * (p1.y - p3.y)

func point_in_traingle(var pt, var v1, var v2, var v3):
	var d1 = signpoint(pt, v1, v2)
	var d2 = signpoint(pt, v2, v3)
	var d3 = signpoint(pt, v3, v1)
	var has_neg = (d1 < 0) || (d2 < 0) || (d3 < 0)
	var has_pos = (d1 > 0) || (d2 > 0) || (d3 > 0)
	return !(has_neg && has_pos)