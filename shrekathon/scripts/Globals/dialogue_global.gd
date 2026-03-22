extends Node

var icons = {
	"shrek": preload("res://assets/gingerbreadman.png"),
	"donkey": 1,
	"pussBoots": 2,
	"rumpel": 3,
	"mirror": preload("res://assets/max_lollipop.png"),
	"fiona": 5
}

var audios = {
	"shrek": preload("res://audio/shrek_dialogue_combination3.mp3"),
	"donkey": 1,
	"pussBoots": 2,
	"rumpel": 3,
	"mirror": preload("res://placeholders/Assets/sounds/talking_synth.ogg"),
	"fiona": 5
}

var current_text:= ["Hi!"]

var mirror_dialogue_one = [
	{
		"icon": icons["shrek"],
		"text": "Hello, and WHO are you?!",
		"audio": audios["shrek"]
	},
	{
		"icon": icons["mirror"],
		"text": "It is I, the Magic Mirror from the hit Dreamworks film, Shrek 1!",
		"audio": audios["mirror"]
	},
	{
		"icon": icons["mirror"],
		"text":"Would you like to learn how to play JumpSHREK?!",
		"audio": audios["mirror"]
	}
]


var also_mirror_dialogue = ["Hello, and WHO are you?!", 
"It is I, the Magic Mirror from the hit Dreamworks film, Shrek 1!",
"Would you like to learn how to play JumpSHREK?!"]
var donkey_dialogue_one = ["donkey dialogue one", 
"donkey dialogue two", 
"donkey dialogue three"]
var puss_dialogue_one = ["puss dialogue one", 
"puss dialogue two", 
"puss dialogue three"]
var rumpel_dialogue = ["rumpel dialogue one", 
"rumpel dialogue two", 
"rumpel dialogue three"]
var fiona_dialogue = 0

var is_mirror_talking = false
var is_donkey_talking = false
var is_puss_talking = false
var is_rumpel_talking = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(is_mirror_talking)

func prepare_mirror_dialogue():
	is_mirror_talking = true
	current_text = mirror_dialogue_one
