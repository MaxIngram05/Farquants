extends CharacterBody2D
class_name BaseNPC

# NPC properties
var npc_name: String = "NPC"
var is_interacting: bool = false
var dialogue: Array[String] = []
var has_been_interacted: bool = false

var npc_karma_reward: int = 0
var choice_1_text: String = "Choice 1"
var choice_2_text: String = "Choice 2"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


# Default interaction behavior
func interact() -> void:
	if is_interacting or has_been_interacted:
		return
	
	is_interacting = true
	on_interact()
	is_interacting = false


# Override this in child classes for custom behavior
func on_interact() -> void:
	print("%s was interacted with" % npc_name)
	show_choices()


# Award score to player
func award_score() -> void:
	if npc_karma_reward > 0:
		print("Awarded %d karma" % npc_karma_reward)
		# Call player_data or game_manager to add score
		PlayerData.karma += npc_karma_reward


# Display choice options to player
func show_choices() -> void:
	print("%s presents two choices:" % npc_name)
	print("1. %s (Karma: %+d)" % [choice_1_text, npc_karma_reward])
	print("2. %s (Karma: %+d)" % [choice_2_text, -npc_karma_reward])
	# TODO: Implement UI to display choices to player


# Handle player's choice selection
func make_choice(choice: int) -> void:
	if choice == 1:
		apply_karma_reward(npc_karma_reward)
		on_choice_1_selected()
	elif choice == 2:
		apply_karma_reward(-npc_karma_reward)
		on_choice_2_selected()
	else:
		print("Invalid choice")
		return
	
	has_been_interacted = true


# Apply karma reward based on choice
func apply_karma_reward(karma_amount: int) -> void:
	PlayerData.karma += karma_amount
	print("Karma changed by %+d (Total: %d)" % [karma_amount, PlayerData.karma])

# Get NPC info
func get_npc_info() -> Dictionary:
	return {
		"name": npc_name,
		"score": npc_karma_reward,
		"dialogue": dialogue
	}


# Event callbacks - override these in child classes for custom behavior
func on_choice_1_selected() -> void:
	pass


func on_choice_2_selected() -> void:
	pass
