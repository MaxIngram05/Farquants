extends Control


func _ready() -> void:
	var bg = ColorRect.new()
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	bg.color = Color(0.05, 0.05, 0.07, 1.0)
	add_child(bg)

	var font = load("res://fonts/MedievalSharp-Regular.ttf")

	var scroll = ScrollContainer.new()
	scroll.set_anchors_preset(Control.PRESET_FULL_RECT)
	scroll.offset_top = 0.0
	scroll.offset_bottom = -80.0
	add_child(scroll)

	var vbox = VBoxContainer.new()
	vbox.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	vbox.custom_minimum_size = Vector2(600, 0)
	vbox.alignment = BoxContainer.ALIGNMENT_CENTER
	scroll.add_child(vbox)

	_add_spacer(vbox, 40)
	_add_label(vbox, "CREDITS", font, 48, true)
	_add_spacer(vbox, 40)

	_add_label(vbox, "Developers", font, 28, true)
	_add_spacer(vbox, 8)
	for name in ["Nicolas Boyer", "Darcy Loane-Billings", "Maximilian Britt Ingram", "Simon Ménard", "Khoi Nguyen"]:
		_add_label(vbox, name, font, 22, false)

	_add_spacer(vbox, 32)
	_add_label(vbox, "Artists", font, 28, true)
	_add_spacer(vbox, 8)
	for name in ["Tess Leblanc", "Adriana Smith", "Simon Ménard", "Nicolas Boyer"]:
		_add_label(vbox, name, font, 22, false)

	_add_spacer(vbox, 32)
	_add_label(vbox, "Music & Sound Design", font, 28, true)
	_add_spacer(vbox, 8)
	for name in ["Yejun Lee", "Tess Leblanc"]:
		_add_label(vbox, name, font, 22, false)

	_add_spacer(vbox, 32)
	_add_label(vbox, "External Resources", font, 28, true)
	_add_spacer(vbox, 8)
	_add_label(vbox, "Kayley Zaidi", font, 22, false)

	_add_spacer(vbox, 60)

	var back_button = Button.new()
	back_button.text = "Back"
	back_button.custom_minimum_size = Vector2(200, 50)
	back_button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	if font:
		var theme = Theme.new()
		theme.set_font("font", "Button", font)
		theme.set_font_size("font_size", "Button", 24)
		back_button.theme = theme
	add_child(back_button)
	back_button.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	back_button.offset_top = -70.0
	back_button.offset_bottom = -10.0
	back_button.pressed.connect(_on_back_pressed)


func _add_label(parent: Control, text: String, font: Font, size: int, bold: bool) -> void:
	var label = Label.new()
	label.text = text
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	if bold:
		label.modulate = Color(1.0, 0.9, 0.5)
	else:
		label.modulate = Color(0.9, 0.9, 0.9)
	var t = Theme.new()
	if font:
		t.set_font("font", "Label", font)
	t.set_font_size("font_size", "Label", size)
	label.theme = t
	parent.add_child(label)


func _add_spacer(parent: Control, height: int) -> void:
	var spacer = Control.new()
	spacer.custom_minimum_size = Vector2(0, height)
	parent.add_child(spacer)


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
