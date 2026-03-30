extends Node

var icons = {
	"shrek": preload("res://assets/shrek_portrait_54px.jpg"),
	"donkey": preload("res://assets/sad-doney-sad-face2_compressed.png"),
	"puss": preload("res://assets/puss_dialogue_image_54.png"),
	"rumpel": preload("res://assets/rumpel_lip_54.jpg"),
	"mirror": preload("res://assets/mirror_png_icon.png"),
	"farquaad": preload("res://assets/farquaad_icon.png"),
	"fiona": preload("res://assets/fiona_dialogue_54px.png"),
	"nothing": null
}

var audios = {
	"shrek": preload("res://audio/longer_audio/shrek_dialogue_+16seconds_copy.mp3"),
	"donkey": preload("res://audio/longer_audio/donkey_dialogue_longer.mp3"),
	"puss": preload("res://audio/longer_audio/puss_dialogue2.mp3"),
	"rumpel": preload("res://audio/longer_audio/rumpy_dialogue_longer+louder.mp3"),
	"mirror": preload("res://audio/longer_audio/mirror_dialogue_v2.mp3"),
	"fiona": preload("res://audio/longer_audio/fiona_dialogue.mp3"),
	"farquaad": preload("res://audio/longer_audio/farquaad_dialogue.mp3"),
	"nothing": null
}

var current_text:= []


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
		"text": "You gotta save [color=green]Fiona[/color] Shrek! She's at the mountain’s peak with [shake][color=red]Lord Farquaad[/color][/shake]!",
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
var donkey_dialogue_yes = [
	{
		"icon": icons["nothing"],
		"text": "You ate the Magic Waffles. They were delicious but you can't let Donkey know that.",
		"audio": audios["nothing"]
	},
	{
		"icon": icons["nothing"],
		"text": "The magic enters your body and you gain the [color=green]WAFFLE DASH[/color].",
		"audio": audios["nothing"]
	},
	{
		"icon": icons["nothing"],
		"text": "Press the Shift key to dash horizontally.",
		"audio": audios["nothing"]
	},
	{
		"icon": icons["donkey"],
		"text": "Wow! You must’ve been REALLY hungry huh? Wellllll… how were they?",
		"audio": audios["donkey"]
	},
	{
		"icon": icons["shrek"],
		"text": "Fine, thank you Donkey. I'll be on my way now.",
		"audio": audios["shrek"]
	}
]

var donkey_dialogue_no = [
	{
		"icon": icons["nothing"],
		"text": "[color=red]You threw away Magic Waffles[/color]. The thought of eating them insulted you.",
		"audio": audios["nothing"]
	},
	{
		"icon": icons["donkey"],
		"text": "Oh.",
		"audio": audios["donkey"]
	},
	{
		"icon": icons["donkey"],
		"text": "Well... I... I see how it is Shrek!",
		"audio": audios["donkey"]
	}
]

var puss_dialogue_one = [
	{
		"icon": icons["puss"],
		"text": "Ahhh, Shrek! I should've known you'd be here to defeat the evil [color=red]Lord Farquaad![/color]",
		"audio": audios["puss"]
	},
	{
		"icon": icons["shrek"],
		"text": "But of course, he has [color=green]Fiona[/color] up there with him!",
		"audio": audios["shrek"]
	},
	{
		"icon": icons["puss"],
		"text": "¡Dios mío! You need to get there as soon as you can!",
		"audio": audios["puss"]
	},
	{
		"icon": icons["puss"],
		"text": "I might have something for you. I've learned some magic that might help.",
		"audio": audios["puss"]
	},
	{
		"icon": icons["puss"],
		"text": "But to do so, I need to be pet.",
		"audio": audios["puss"]
	},
	{
		"icon": icons["shrek"],
		"text": "What? You can't be serious?!",
		"audio": audios["shrek"]
	},
	{
		"icon": icons["puss"],
		"text": "Oh but I am! Please Shrek, it won't take that long! It'll be worth it!",
		"audio": audios["puss"]
	}
]

var puss_dialogue_yes = [
	{
		"icon": icons["puss"],
		"text": "Ahhhhh, that felt great! You're quite the cat person, Shrek!",
		"audio": audios["puss"]
	},
	{
		"icon": icons["puss"],
		"text": "Ok now to use up my end of the deal",
		"audio": audios["puss"]
	},
	{
		"icon": icons["nothing"],
		"text": "Puss throws a magic bean into your mouth.",
		"audio": audios["nothing"]
	},
	{
		"icon": icons["nothing"],
		"text": "You gained the [color=green] CAT DASH[/color].",
		"audio": audios["nothing"]
	},
	{
		"icon": icons["nothing"],
		"text": "Press the space bar while up in the air to shoot up vertically.",
		"audio": audios["nothing"]
	},
	{
		"icon": icons["shrek"],
		"text": "Ohohoooo! This seems promising.",
		"audio": audios["shrek"]
	},
	{
		"icon": icons["shrek"],
		"text": "But wait, did you REALLY need to be pet to just do that?",
		"audio": audios["shrek"]
	},
	{
		"icon": icons["puss"],
		"text": "[shake]Hahahaaaa[/shake].... nah.",
		"audio": audios["puss"]
	}
]
var puss_dialogue_no = [
	{
		"icon": icons["nothing"],
		"text": "[color=red]You ignore Puss' request and splash him with water[/color].",
		"audio": audios["nothing"]
	},
	{
		"icon": icons["puss"],
		"text": "[shake] AAAAAAAAAAAA [/shake]",
		"audio": audios["puss"]
	},
	{
		"icon": icons["puss"],
		"text": "[shake] HISSSSSSSSSS [/shake] I see my services here are not welcome",
		"audio": audios["puss"]
	}
]

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
		"text": "I know [color=green]Fiona[/color] is up there Shrek. And you're in the final stretch.",
		"audio": audios["rumpel"]
	},
	{
		"icon": icons["rumpel"],
		"text": "But you're going to need [wave]alllllllll[/wave] the help you can get for this last part!",
		"audio": audios["rumpel"]
	},
	{
		"icon": icons["rumpel"],
		"text": "Which is where I come in! I have a contract Shrek! Sign it and I'll grant you immeasurable power!",
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
		"audio": audios["nothing"]
	},
	{
		"icon": icons["nothing"],
		"text": "You may charge your jump even longer with the Space bar to get an even better boost.",
		"audio": audios["nothing"]
	},
	{
		"icon": icons["shrek"],
		"text": "Hmph. I suppose you were actually useful for once.",
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
		"text": "[color=red]You hit Rumpelstilskin. It feels good getting a physical payback on him.[/color]",
		"audio": audios["nothing"]
	},
	{
		"icon": icons["shrek"],
		"text": "I hope that leaves a mark Forever After this encounter!",
		"audio": audios["shrek"]
	},
]

var fiona_dialogue = [
	#0
	{
		"icon": icons["fiona"],
		"text": "Shrek! You made it!",
		"audio": audios["fiona"]
	},
	#1
	{
		"icon": icons["farquaad"],
		"text": "THE FILTHY OGRE MADE IT!",
		"audio": audios["farquaad"]
	},
	#2
	{
		"icon": icons["shrek"],
		"text": "Come on Fiona! I'll take down [color=red]Farquaad[/color] and then we can go home.",
		"audio": audios["shrek"]
	},
	#3
	{
		"icon": icons["fiona"],
		"text": "Shrek, I...",
		"audio": audios["fiona"]
	},
	#4
	{
		"icon": icons["fiona"],
		"text": "<reaction on how good you have been>",
		"audio": audios["fiona"]
	},
	#5
	{
		"icon": icons["fiona"],
		"text": "<second reaction on how good you have been>",
		"audio": audios["fiona"]
	},
	#6
	{
		"icon": icons["fiona"],
		"text": "<third reaction on how good you have been>",
		"audio": audios["fiona"]
	},
	#7
	{
		"icon": icons["farquaad"],
		"text": "<reaction on how good you have been>",
		"audio": audios["farquaad"]
	},
	#8
	{
		"icon": icons["nothing"],
		"text": "<second reaction on how good you have been>",
		"audio": audios["nothing"]
	},
]

var is_mirror_talking = false
var is_donkey_talking = false
var is_puss_talking = false
var is_rumpel_talking = false
var is_fiona_talking = false


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
	is_fiona_talking = false

func prepare_fiona_ending():
	is_fiona_talking = true
	if UnlockSystem.is_good_ending():
		fiona_dialogue[4]["text"] = "I saw your voyage upwards and how much of a [color=green]saint[/color] you were!"
		fiona_dialogue[5]["text"] = "Eating with Donkey, petting Puss and seeing Rumpel's good side!"
		fiona_dialogue[6]["text"] = "I knew I married the right man!"
		fiona_dialogue[7]["text"] = "CURSES! I'll never hand over my bethrothed!"
		fiona_dialogue[8]["text"] = "You swoop in, defeat Farquaad and rescue your beloved Fiona."
		fiona_dialogue[8]["audio"] = audios["nothing"]
	elif UnlockSystem.is_bad_ending():
		fiona_dialogue[4]["text"] = "You were awful to everyone! You threw Donkey's food and hurt Puss!"
		fiona_dialogue[5]["text"] = "And Rumpelstiltskin is trying to be good!"
		fiona_dialogue[6]["text"] = "This isn't the ogre I fell in love with. [color=red]I don't want to marry you anymore[/color]."
		fiona_dialogue[7]["text"] = "[wave]Welllllll...[/wave] I find this evil side of you quite... [wave]Attractive[/wave], ogre."
		fiona_dialogue[8]["text"] = "Farquaad approaches for a kiss."
		fiona_dialogue[8]["audio"] = audios["nothing"]
	else:
		fiona_dialogue[4]["text"] = "You came all this way to save me!"
		fiona_dialogue[5]["text"] = "But on the way, you made... some mistakes. And I don't know if I can forgive you yet for that."
		fiona_dialogue[6]["text"] = "But for now, let's stop Farquaad, together. Once and for all!"
		fiona_dialogue[7]["text"] = "STOP YOU MONSTERS! I AM THE NEW RULER OF THIS KINGDOM! [shake]KNEEL BEFORE ME![/shake]"
		fiona_dialogue[8]["text"] = "Farquaad is defeated and you save Fiona, but your relationship now seems fractured."
		fiona_dialogue[8]["audio"] = audios["nothing"]
	current_text = fiona_dialogue

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
	current_text = donkey_dialogue_yes
	UnlockSystem.obtainedHorizontalDash = true

func shrek_no_donkey():
	current_text = donkey_dialogue_no

func prepare_puss_dialogue():
	is_puss_talking = true
	current_text = puss_dialogue_one

func shrek_yes_puss():
	current_text = puss_dialogue_yes
	UnlockSystem.obtainedVerticalDash = true

func shrek_no_puss():
	current_text = puss_dialogue_no

func prepare_rumpel_dialogue():
	is_rumpel_talking = true
	current_text = rumpel_dialogue_one

func shrek_yes_rumpel():
	current_text = rumpel_dialogue_yes
	UnlockSystem.obtainedJumpExtend = true

func shrek_no_rumpel():
	current_text = rumpel_dialogue_no
