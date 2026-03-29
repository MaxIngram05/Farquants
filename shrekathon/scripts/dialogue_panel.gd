extends Node2D
@onready var rich_text_label: RichTextLabel = %RichTextLabel
@onready var audio_stream_player: AudioStreamPlayer = %AudioStreamPlayer
@onready var texture_rect: TextureRect = $TextureRect

var base_dialogue = DialogueGlobal.current_text
var tween: Tween

var current_dialogue_index = 0
var can_advance_text:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_dialogue_index = 0
	rich_text_label.visible_ratio = 0
	show_text()
	if UnlockSystem.isEndingMenu:
		print("is ending!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and can_advance_text == true   :
		advance()
	elif Input.is_action_just_pressed("ui_accept") and tween and tween.is_running():
		go_to_end_of_text()
	#made elif so that ONLY ONE OF THESE TWO HAPPENS SINCE THEY BOTH CHECK IF SPACE PRESSED

func show_text():
	if tween:
		tween.kill()
	if DialogueGlobal.current_text.size() <= current_dialogue_index:
		return
	can_advance_text = false
	rich_text_label.visible_ratio = 0 
	var current_text = DialogueGlobal.current_text[current_dialogue_index]
	texture_rect.texture = current_text["icon"]
	audio_stream_player.stream = current_text["audio"]
	rich_text_label.text = current_text["text"]
	rich_text_label.visible_ratio = 0
	var text_show_duration:float = max(0.5, current_text["text"].length() / 20.0) #picks the higher of the two
	tween = create_tween()
	tween.tween_property(rich_text_label, "visible_ratio", 1, text_show_duration)
	if (audio_stream_player.stream != null):
		var sound_offset = audio_stream_player.stream.get_length() - text_show_duration
		var sound_start = randf() * sound_offset
		audio_stream_player.play(sound_start)

	tween.finished.connect(on_tween_finished)

func on_tween_finished():
	audio_stream_player.stop()
	can_advance_text = true

func go_to_end_of_text():
	if tween:
		tween.kill()
		rich_text_label.visible_ratio = 1
		audio_stream_player.stop()
		can_advance_text = true

func advance():
	current_dialogue_index += 1
	if current_dialogue_index == len(base_dialogue):
		queue_free()
	else:
		show_text()
	
func settle_dialogue():
	pass
