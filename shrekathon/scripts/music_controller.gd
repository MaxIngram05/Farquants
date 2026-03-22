extends Node
# REPLACE THESE FOR THE APPROPRIATE LEVELSTREAMPLAYERS
#import this, call relevant methods from the level controller
@onready var lvl1_music = "res://audio/music/raw/lvl1 1st file.ogg"
@onready var lvl2_music = "res://audio/music/raw/lvl2 can just loop this.ogg"
@onready var lvl3_music = "res://audio/music/raw/lvl3 2nd file.ogg"
@onready var boss_music = "res://audio/music/raw/bossfight 2nd file.ogg"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lvl1_music.stream.loop = true
	lvl1_music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func enter_level_2():
	lvl1_music.stream.loop = false
	var ts = lvl1_music.get_playback_position()
	lvl2_music.play(ts)
	lvl2_music.stream.loop = true
	
func enter_level_3():
	lvl2_music.stream.loop = false
	var ts = lvl2_music.get_playback_position()
	lvl3_music.play(ts)
	lvl3_music.stream.loop = true

func kill_music():
	lvl1_music.stop()
	lvl2_music.stop()
	lvl3_music.stop()
	boss_music.stop()
	
func play_boss_music():
	kill_music()
	boss_music.play()
