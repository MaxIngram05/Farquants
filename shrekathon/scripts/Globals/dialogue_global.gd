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


var mirror_dialogue_yes = [
	{
		"icon": icons["mirror"],
		"text": "Great! This game is literally Jump King. Press Space to go to the next dialogue.",
		"audio": audios["mirror"]
	},
	{
		"icon": icons["mirror"],
		"text": "You can jump around by holding the space bar and letting go.",
		"audio": audios["mirror"]
	},
	{
		"icon": icons["mirror"],
		"text": "Depending on how long you held the space bar before letting go…",
		"audio": audios["mirror"]
	},
		{
		"icon": icons["mirror"],
		"text": "you will jump either really high or not that much",
		"audio": audios["mirror"]
	},
		{
		"icon": icons["mirror"],
		"text": "Make sure to press the A or D key to move left or right.",
		"audio": audios["mirror"]
	},
	{
		"icon": icons["mirror"],
		"text": "You can hit walls while moving up, bouncing you away from them.",
		"audio": audios["mirror"]
	},
	{
		"icon": icons["mirror"],
		"text": "They will still carry your momentum so use this to your advantage.",
		"audio": audios["mirror"]
	},
	{
		"icon": icons["mirror"],
		"text": "While you’re already very strong my dear Shrek, you may acquire…",
		"audio": audios["mirror"]
	},
	{
		"icon": icons["mirror"],
		"text": "…newer abilities throughout your trek.",
		"audio": audios["mirror"]
	},
	{
		"icon": icons["mirror"],
		"text": "I suggest learning how to use them as soon as you can",
		"audio": audios["mirror"]
	},
	{
		"icon": icons["mirror"],
		"text": "Best of luck!",
		"audio": audios["mirror"]
	},
]

var mirror_dialogue_no = [
	{
		"icon": icons["mirror"],
		"text": "ok glhf press space to leave this conversation",
		"audio": audios["mirror"]
	}
]

var donkey_dialogue_one = 0
var donkey_dialogue_yes = 0
var donkey_dialogue_no = 0

var puss_dialogue_one = 0
var puss_dialogue_yes = 0
var puss_dialogue_no = 0


var donkey_dialogue_ones = ["donkey dialogue one", 
"donkey dialogue two", 
"donkey dialogue three"]
var puss_dialogue_ones = ["puss dialogue one", 
"puss dialogue two", 
"puss dialogue three"]
var rumpel_dialogues = ["rumpel dialogue one", 
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
	pass

func prepare_mirror_dialogue():
	is_mirror_talking = true
	current_text = mirror_dialogue_one

func shrek_yes_mirror():
	current_text = mirror_dialogue_yes

func shrek_no_mirror():
	current_text = mirror_dialogue_no

func prepare_puss_dialogue():
	is_puss_talking = true
