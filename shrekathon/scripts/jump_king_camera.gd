extends Camera2D

# Viewport is 1280x960 with zoom 4x4, so world screen size = 320x240
# screen_height set to 100 for testing (first snap triggers at y = -100)
var screen_width = 430
var screen_height = 320

func _process(_delta):
	var player = get_parent()
	global_position.x = floor(player.global_position.x / screen_width) * screen_width + screen_width / 2.0
	global_position.y = floor(player.global_position.y / screen_height) * screen_height + screen_height/2
