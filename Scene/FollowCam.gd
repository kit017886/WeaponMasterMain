extends Camera2D

@export var tilemap: TileMap
# Called when the node enters the scene tree for the first time.
func _ready():
	var map_rect = tilemap.get_used_rect()
	var title_size = tilemap.tile_set.tile_size.x
	var world_size_in_pixels = map_rect.size * title_size
	limit_right = world_size_in_pixels.x
	limit_bottom = world_size_in_pixels.y
	
