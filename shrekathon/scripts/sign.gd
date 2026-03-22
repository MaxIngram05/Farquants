extends Area2D
@onready var rich_text_label: RichTextLabel = $RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rich_text_label.visible = false
	add_to_group("mirror")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_area_2d_body_entered(body: Node2D) -> void:
	rich_text_label.visible = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	rich_text_label.visible = false



func _on_area_entered(area: Area2D) -> void:
	rich_text_label.visible = true


func _on_area_exited(area: Area2D) -> void:
	rich_text_label.visible = false
