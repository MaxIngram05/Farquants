extends Control

const DIALOGUE_SCENE = preload("res://scenes/dialogue_panel.tscn")
@onready var outcome_image: TextureRect = $CenterContainer/OutcomeImage
@onready var outcome_image_2: TextureRect = $OutcomeImage2

@onready var dialogue_panel: Node2D = $dialogue_panel

var neutral_ending_image = 0
var bad_ending_image = preload("res://assets/shrek_bad_ending.png")
var good_ending_image= preload("res://assets/shrek_good_ending.png")
var neutral_image_1 = preload("res://assets/shrek_neutral_ending_1_smallest.jpg")
var neutral_image_2 = preload("res://assets/shrek_neutral_ending_2.jpg")
@onready var ending_label: RichTextLabel = $EndingLabel
@onready var shrek_sprite: AnimatedSprite2D = $ShrekSprite
@onready var fiona_sprite: AnimatedSprite2D = $FionaSprite
@onready var farquaad_sprite: AnimatedSprite2D = $FarquaadSprite
@onready var button: Button = $CenterContainer2/Button

var extra_fiona_dialogue

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.hide()
	outcome_image.modulate.a = 0
	outcome_image_2.modulate.a = 0
	ending_label.visible = false

	DialogueGlobal.prepare_fiona_ending()
	
	var dialogue = DIALOGUE_SCENE.instantiate()
	add_child(dialogue)
	dialogue.position = Vector2(650, 800)
	dialogue.scale = Vector2(1.5, 1.5)
	
	dialogue.tree_exited.connect(_on_dialogue_finished)
	
	var outcomeTween = create_tween()

func _on_dialogue_finished():
	button.show()
	shrek_sprite.visible = false 
	fiona_sprite.visible = false
	farquaad_sprite.visible = false 
	ending_label.visible = true
	if UnlockSystem.is_good_ending():
		var outcomeTween = create_tween()
		outcomeTween.tween_property(outcome_image, "modulate:a", 1, 3)
		ending_label.text = "You got the [color=green]GOOD ENDING[/color]! You were nice to everyone and gained all of the powers along the way! Fiona, madly in love, embraces you as a defeated Farquaad lies on the ground. You have saved your love and the kingdom."
		button.text = "You Won. Return to Main Menu"
	elif UnlockSystem.is_bad_ending():
		var outcomeTween = create_tween()
		outcomeTween.tween_property(outcome_image, "modulate:a", 1, 3)
		ending_label.text = "You got the [color=red]EVIL ENDING[/color]! You were rude to everyone in your path and gained no new powers while jumping. You lost your wife and instead marry the evil Lord Farquaad. Together, you rule the entire world. No one can stop this power couple!"
		button.text = "You Won? Return to Main Menu"
	else:
		var outcomeTween = create_tween()
		outcomeTween.tween_property(outcome_image, "modulate:a", 1, 3)
		outcomeTween.set_parallel()
		outcomeTween.tween_property(outcome_image_2, "modulate:a", 1, 3)
		ending_label.text = "You got the NEUTRAL ENDING! You were rude to some and nice to others. Fiona seems grateful but is unhappy with some of your actions. You reach in for a kiss and she walks away. Perhaps if you were [color=green]nice to everyone[/color], then she'd give you a kiss!"
		button.text = "You Won. Return to Main Menu"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if UnlockSystem.is_good_ending():
		outcome_image.texture = good_ending_image
	elif UnlockSystem.is_bad_ending():
		outcome_image.texture = bad_ending_image
	elif UnlockSystem.is_neutral_ending():
		outcome_image.texture = neutral_image_1
		outcome_image.flip_h = true
		outcome_image.position = Vector2(600, 400)
		outcome_image_2.texture = neutral_image_2
		outcome_image_2.position = Vector2(184, 400)
	else:
		print("This should never happen")


func _on_button_pressed() -> void:
	UnlockSystem.resultList = [false, false, false]
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
