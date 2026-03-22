extends CharacterBody2D
@onready var anim = $AnimatedSprite2D

const DIALOGUE_SCENE = preload("res://scenes/dialogue_panel.tscn")
const DECISION_PANEL = preload("res://scenes/decision_panel.tscn")

# Sound effects
var sfx_jump: AudioStreamPlayer
var sfx_fart_jump: AudioStreamPlayer
var sfx_ground_pound: AudioStreamPlayer
var sfx_enemy_hit: AudioStreamPlayer

const SPEED = 100.0
const JUMP_VELOCITY = -200.0
const WALL_JUMP_VELOCITY_Y = 20.0
const WALL_JUMP_VELOCITY_X = 20.0
const MAX_CHARGE_TIME = 1.0
const CHARGE_JUMP_MULTIPLIER = 2.5
const SUPER_CHARGE_TIME = 1.0
const SUPER_JUMP_MULTIPLIER = 1.4142 # sqrt(2) — doubles the height

var charge_time := 0.0
var is_charging := false
var is_super_charging := false
var is_talking = false
var charge_direction := 0.0
var jump_direction := 0.0

var is_jumping := false;
var target_mirror = null
var target_donkey = null
var target_cat = null
var target_rumpel = null

#dash variables
const DASH_AMOUNT: float = 350.0
const DASH_TIME: float = 0.25
var vertical_jumps = 1
var can_horz_dash: bool = true
var can_vert_dash: bool = false
var is_dashing: bool = false
var vertical_dash_direction: Vector2 = Vector2.UP
var horizontal_dash_direction: Vector2 = Vector2.RIGHT
var dash_timer: float = 0.0
#end of dash variables

#groundpound variables
const GROUNDPOUND_VELOCITY: float = 600.0
var is_groundpounding: bool = false
#end of groundpound variables

@export var speed_scale: float = 1.0 # Multiplier for movement (1.0 = normal, 0.2 = 20% speed)
@export var dir = 0;

@onready var right_wall: RayCast2D = $RightWall
@onready var left_wall: RayCast2D = $LeftWall
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _create_sfx(path: String) -> AudioStreamPlayer:
	var player = AudioStreamPlayer.new()
	player.stream = load(path)
	add_child(player)
	return player

func _ready() -> void:
	add_to_group("player")
	UnlockSystem.can_move = true
	sfx_jump = _create_sfx("res://audio/shrek_jumps.mp3")
	sfx_fart_jump = _create_sfx("res://audio/fart_jump.mp3")
	sfx_ground_pound = _create_sfx("res://audio/ground_pound.mp3")
	sfx_enemy_hit = _create_sfx("res://audio/ohhhh.wav")

func _physics_process(delta: float) -> void:
	#people interaction
	if UnlockSystem.can_move:
		# Apply gravity
		if not is_on_floor():
			velocity += get_gravity() * delta

		dir = 0;

		if is_on_floor():
			can_vert_dash = false
			vertical_jumps = 1
			var left = Input.is_key_pressed(KEY_A)
			var right = Input.is_key_pressed(KEY_D)
			dir = (float(right) - float(left)) * speed_scale
			if !is_dashing and !can_horz_dash:
				can_horz_dash = true

		if !is_on_floor() and is_jumping:
			if right_wall.is_colliding() and jump_direction > 0:
				velocity.x -= WALL_JUMP_VELOCITY_X
				velocity.y -= WALL_JUMP_VELOCITY_Y
			if left_wall.is_colliding() and jump_direction < 0:
				velocity.x += WALL_JUMP_VELOCITY_X
				velocity.y -= WALL_JUMP_VELOCITY_Y
			if !is_dashing and !can_vert_dash:
				can_vert_dash = true

		# Charging logic (hold Space)
		if !is_dashing:
			if Input.is_action_pressed("ui_accept") and is_on_floor():
				charge_direction = dir
				velocity.x = 0.0
				if charge_time < MAX_CHARGE_TIME:
					is_charging = true
					charge_time = min(charge_time + delta, MAX_CHARGE_TIME)
				elif UnlockSystem.obtainedJumpExtend:
					# Max charge reached — extend into super charge
					is_super_charging = true
			elif (Input.is_action_just_released("ui_accept") and (is_charging or is_super_charging)):
				# Release: launch with charged or super jump
				var base_velocity = JUMP_VELOCITY * CHARGE_JUMP_MULTIPLIER
				if is_super_charging:
					velocity.y = base_velocity * SUPER_JUMP_MULTIPLIER
				else:
					var charge_ratio = charge_time / MAX_CHARGE_TIME
					velocity.y = JUMP_VELOCITY * (1.0 + charge_ratio * (CHARGE_JUMP_MULTIPLIER - 1.0))
				velocity.x = charge_direction * SPEED * (1.0 + charge_time / MAX_CHARGE_TIME)
				is_charging = false
				is_super_charging = false
				jump_direction = charge_direction
				is_jumping = true
				charge_time = 0.0
				charge_direction = 0.0
				sfx_jump.play()
			elif is_on_floor():
				# Normal horizontal movement
				is_jumping = false
				if dir:
					velocity.x = dir * SPEED
				else:
					velocity.x = move_toward(velocity.x, charge_direction, SPEED)

		ground_pound()
		horizontal_dash(delta)
		veritcal_dash(delta)
		move_and_slide()

		if is_on_floor() and is_groundpounding:
			is_groundpounding = false

		# Animation and sprite flip
			# Animation logic - put this BEFORE move_and_slide()
		# Animation logic
		
		if is_charging or is_groundpounding:
			anim.play("charging")
		elif not is_on_floor():
			# Use "idle" or a specific "jump" frame if you have one
			anim.play("jumping")
		elif dir > 0:
			anim.play("walking_right")
		elif dir < 0:
			anim.play("walking_left")
		elif Input.is_key_pressed(KEY_SHIFT):
			anim.play("dashing_left")
		else:
			anim.play("idle")

func horizontal_dash(delta: float) -> void:
	var input_dir: float = Input.get_axis("left", "right")

	if input_dir != 0:
		horizontal_dash_direction.x = input_dir
	if can_horz_dash and UnlockSystem.obtainedHorizontalDash and Input.is_action_just_pressed("horizontal_dash"):
		print("horizontal dashing!")
		can_horz_dash = false
		is_dashing = true
		dash_timer = DASH_TIME
		velocity = horizontal_dash_direction * DASH_AMOUNT

	if is_dashing:
		dash_timer -= delta
		if dash_timer <= 0.0:
			is_dashing = false

func veritcal_dash(delta: float) -> void:
	if can_vert_dash and UnlockSystem.obtainedVerticalDash and Input.is_action_just_pressed("jump") and vertical_jumps > 0:
		print("vertical dashing!")
		can_vert_dash = false
		vertical_jumps -= 1
		dash_timer = DASH_TIME
		velocity = vertical_dash_direction * DASH_AMOUNT
		sfx_fart_jump.play()
		print(vertical_jumps)
	if is_dashing:
		dash_timer -= delta
		if dash_timer <= 0.0:
			is_dashing = false


func play_hit_sound() -> void:
	sfx_enemy_hit.play()


func ground_pound() -> void:
	if not UnlockSystem.obtainedGroundPound:
		return
	if not is_on_floor() and not is_groundpounding and Input.is_key_pressed(KEY_S):
		is_groundpounding = true
		velocity.x = 0.0
		velocity.y = GROUNDPOUND_VELOCITY
		sfx_ground_pound.play()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("mirror"):
		target_mirror = body
		print("Near a mirror!")

func _on_area_2d_area_entered(area: Area2D) -> void:
	print("I touched an area named: ", area.name) # Add this!
	if area.name == "Sign":
		target_mirror = area
		print("Near a mirror!")
		print("target_mirror is: ", str(target_mirror))
	if area.name == "DonkeyArea":
		target_donkey = area
		print("ur with donkey!")
	if area.name == "Puss":
		target_cat = area
		print("puss!")
	if area.name == "RumpelArea":
		target_rumpel = area
		print("rumpel!")

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area == target_mirror:
		target_mirror = null
		print("Left mirror range")
		print("target_mirror is: ", str(target_mirror))
	if area == target_donkey:
		target_donkey = null
		print("Left Donkey!")
	if area == target_cat:
		target_cat = null
		print("Left Donkey!")
	if area == target_rumpel:
		target_rumpel = null
		print("Left Rumpel!")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		print("interact pressed!")
		if target_mirror != null:
			print("Interacting with mirror!")
			DialogueGlobal.prepare_mirror_dialogue()
			UnlockSystem.can_move = false
			trigger_mirror_dialogue()
		if target_donkey != null:
			print("Donkey time!")
			DialogueGlobal.prepare_donkey_dialogue()
			UnlockSystem.can_move = false
			trigger_donkey_dialogue()
		if target_cat != null:
			print("Puss time!")
			DialogueGlobal.prepare_puss_dialogue()
			UnlockSystem.can_move = false
			trigger_puss_dialogue()
		if target_rumpel != null:
			print("Rumpel Time!")
			DialogueGlobal.prepare_rumpel_dialogue()
			UnlockSystem.can_move = false
			trigger_rumpel_dialogue()

func trigger_mirror_dialogue():
	DialogueGlobal.is_mirror_talking = true
	trigger_overall_dialogue()

func trigger_donkey_dialogue():
	DialogueGlobal.is_donkey_talking = true
	trigger_overall_dialogue()

func trigger_puss_dialogue():
	DialogueGlobal.is_puss_talking = true
	trigger_overall_dialogue()

func trigger_rumpel_dialogue():
	DialogueGlobal.is_rumpel_talking = true
	trigger_overall_dialogue()

func trigger_overall_dialogue():
	if is_talking: return
	is_talking = true

	var dialogue_instance = DIALOGUE_SCENE.instantiate()

	dialogue_instance.tree_exited.connect(func():
		print("Time for a Decision!")
		show_decision_panel()
		)

	add_child(dialogue_instance)

	# Position it 100 pixels above the player's center
	dialogue_instance.position = Vector2(0, -100)

	dialogue_instance.show_text()

func show_decision_panel():
	var decision_instance = DECISION_PANEL.instantiate()
	
	decision_instance.tree_exited.connect(func():
		trigger_overall_dialogue_after_choice()
	)
	add_child(decision_instance)
	# Match the position where the dialogue was
	decision_instance.position = Vector2(0, -100)

func trigger_overall_dialogue_after_choice():
	var dialogue_instance = DIALOGUE_SCENE.instantiate()

	dialogue_instance.tree_exited.connect(func():
		is_talking = false
		UnlockSystem.can_move = true
		DialogueGlobal.make_talking_false()
		print("Free Shrek!")
	)

	add_child(dialogue_instance)
	dialogue_instance.position = Vector2(0, -100)
	dialogue_instance.show_text()
