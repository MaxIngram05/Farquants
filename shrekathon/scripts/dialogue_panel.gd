extends Node2D
@onready var rich_text_label: RichTextLabel = %RichTextLabel
@onready var audio_stream_player: AudioStreamPlayer = %AudioStreamPlayer

var base_dialogue: Array[String] = [
	"Hi, my name is Darcy!",
	"Hi, my name is Simon!",
	"Hi, my name is Max!"
]

var current_dialogue_index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_dialogue_index = 0
	show_text()
	rich_text_label.visible_ratio = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func show_text():
	var current_text = base_dialogue[current_dialogue_index]
	rich_text_label.text = current_text
	rich_text_label.visible_ratio = 0
	var tween = create_tween()
	var text_show_duration:float = current_text.length() / 15
	tween.tween_property(rich_text_label, "visible_ratio", 1, text_show_duration)

func advance():
	current_dialogue_index += 1
	show_text()
	
func settle_dialogue():
	pass
