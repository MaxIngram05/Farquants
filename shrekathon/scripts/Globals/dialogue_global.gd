extends Node

var icons = {
	"shrek": preload("res://assets/gingerbreadman.png"),
	"donkey": preload("res://assets/sad-doney-sad-face2_compressed.png"),
	"pussBoots": 2,
	"rumpel": preload("res://assets/rumpel_lip_54.jpg"),
	"mirror": preload("res://assets/max_lollipop.png"),
	"fiona": 5,
	"nothing": null
}

var audios = {
	"shrek": preload("res://audio/shrek_dialogue_combination3.mp3"),
	"donkey": preload("res://audio/donkey_dialogue_combination_(compressed).mp3"),
	"pussBoots": 2,
	"rumpel": preload("res://audio/donkey_dialogue_combination_(compressed).mp3"),
	"mirror": preload("res://placeholders/Assets/sounds/talking_synth.ogg"),
	"fiona": 5,
	"nothing": null
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

var donkey_dialogue_one = [
	{
		"icon": icons["donkey"],
		"text": "SHREK! Hallelujah, you're here!",
		"audio": audios["donkey"]
	},
	{
		"icon": icons["donkey"],
		"text": "You gotta save Fiona Shrek! She's at the mountain’s peak with [shake][color=red]Lord Farquaad[/color][/shake]!",
		"audio": audios["donkey"]
	},
	{
		"icon": icons["shrek"],
		"text": "Oh? Well you got a head start! Why don’t YOU go do it?",
		"audio": audios["shrek"]
	},
	{
		"icon": icons["donkey"],
		"text": "I barely made it up here Shrek, and it’s only gonna get harder from here!",
		"audio": audios["donkey"]
	},
	{
		"icon": icons["donkey"],
		"text": "And besides,I have something for you Shrek.",
		"audio": audios["donkey"]
	},
	{
		"icon": icons["shrek"],
		"text": "Oh yeah? And WHAT might that be?",
		"audio": audios["shrek"]
	},
	{
		"icon": icons["donkey"],
		"text": "Well obviously my [wave][color=yellow]Magical Waffles[/color][/wave] of course!",
		"audio": audios["donkey"]
	},
	{
		"icon": icons["donkey"],
		"text": "I was about to eat them of course but if you’re going up there, they might really help you!",
		"audio": audios["donkey"]
	},
	{
		"icon": icons["donkey"],
		"text": "Go on, have a snack!",
		"audio": audios["donkey"]
	}
]
var donkey_dialogue_yes = 0
var donkey_dialogue_no = 0

var puss_dialogue_one = 0
var puss_dialogue_yes = 0
var puss_dialogue_no = 0

var rumpel_dialogue_one = [
	{
		"icon": icons["rumpel"],
		"text": "Shrekkkk! How are you doing?! Long time no see.",
		"audio": audios["rumpel"]
	},
	{
		"icon": icons["shrek"],
		"text": "Hello Rumpel. Here to send me to another alternate timeline?",
		"audio": audios["shrek"]
	},
	{
		"icon": icons["rumpel"],
		"text": "Oh hahahahaha! No no [shake]no[/shake] [shake]no[/shake] [shake]NO[/shake]!",
		"audio": audios["rumpel"]
	},
	{
		"icon": icons["rumpel"],
		"text": "I have... an [wave][shake][color=yellow]alternative[/color][/shake][/wave] deal I want to make with you",
		"audio": audios["rumpel"]
	},
	{
		"icon": icons["rumpel"],
		"text": "I know Fiona is up there Shrek. And you're in the final stretch.",
		"audio": audios["rumpel"]
	},
	{
		"icon": icons["rumpel"],
		"text": "But you're going to need [wave]alllllllll[/wave] the help you can get for this last part!",
		"audio": audios["rumpel"]
	},
	{
		"icon": icons["rumpel"],
		"text": "Which is where I come in! I have a contract Shrek! Sign it and I'll grant you immeasurable power",
		"audio": audios["rumpel"]
	},
	{
		"icon": icons["shrek"],
		"text": "And WHY should I trust you?!",
		"audio": audios["shrek"]
	},
	{
		"icon": icons["rumpel"],
		"text": "Oh come on Shrek, you're running out of time so [shake level=10]sign the contract[/shake].",
		"audio": audios["rumpel"]
	},
	{
		"icon": icons["rumpel"],
		"text": "[shake rate=40 level=20]SIGN IT SHREK! SIGN MY CONTRACT![/shake]",
		"audio": audios["rumpel"]
	},
	
]

var rumpel_dialogue_yes = [
	{
		"icon": icons["nothing"],
		"text": "You signed the contract. You are flushed with a new power. You gained the SUPER JUMP.",
		"audio": audios["shrek"]
	},
	{
		"icon": icons["nothing"],
		"text": "You may charge your jump even longer with the Space bar to get an even better boost.",
		"audio": audios["shrek"]
	},
	{
		"icon": icons["shrek"],
		"text": "Hmph. I supposed you were actually useful for once.",
		"audio": audios["shrek"]
	},
	{
		"icon": icons["rumpel"],
		"text": "[shake]HAHAHAHAHA[/shake] when haven't I been?",
		"audio": audios["rumpel"]
	},
]
var rumpel_dialogue_no = [
	{
		"icon": icons["rumpel"],
		"text": "Hmmmph. Your loss then!",
		"audio": audios["rumpel"]
	},
	{
		"icon": icons["shrek"],
		"text": "Now that THAT'S out of the way, take this!",
		"audio": audios["shrek"]
	},
	{
		"icon": icons["nothing"],
		"text": "You hit Rumpelstilskin and gain XXX",
		"audio": audios["shrek"]
	},
	{
		"icon": icons["shrek"],
		"text": "I hope that leaves a mark Forever After this encounter!",
		"audio": audios["shrek"]
	},
]

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

func make_talking_false():
	is_mirror_talking = false
	is_donkey_talking = false
	is_puss_talking = false
	is_rumpel_talking = false

func prepare_mirror_dialogue():
	is_mirror_talking = true
	current_text = mirror_dialogue_one

func shrek_yes_mirror():
	current_text = mirror_dialogue_yes

func shrek_no_mirror():
	current_text = mirror_dialogue_no

func prepare_donkey_dialogue():
	is_donkey_talking = true
	current_text = donkey_dialogue_one

func shrek_yes_donkey():
	current_text = ["lol"]

func shrek_no_donkey():
	current_text = ["idk"]

func prepare_puss_dialogue():
	is_puss_talking = true

func shrek_yes_puss():
	current_text = ["lol"]

func shrek_no_puss():
	current_text = ["idk"]

func prepare_rumpel_dialogue():
	is_rumpel_talking = true
	current_text = rumpel_dialogue_one

func shrek_yes_rumpel():
	current_text = rumpel_dialogue_yes

func shrek_no_rumpel():
	current_text = rumpel_dialogue_no
	UnlockSystem.obtainedHorizontalDash = true
