extends Node

# Karma system - tracks player's moral alignment
const MIN_KARMA := 0
const MAX_KARMA := 100
const DEFAULT_KARMA := 50
const PERFECTLY_NEUTRAL_KARMA := 50

var karma := DEFAULT_KARMA

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	karma = clamp(karma, MIN_KARMA, MAX_KARMA)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


# Check if player is good (karma < 25)
func is_good() -> bool:
	return karma < 25


# Check if player is bad (karma > 75)
func is_bad() -> bool:
	return karma > 75


# Check if player is neutral (karma between 25 and 75)
func is_neutral() -> bool:
	return karma >= 25 and karma <= 75


# Check if player is perfectly neutral (karma == 50) for special convo?
func is_perfectly_neutral() -> bool:
	return karma == PERFECTLY_NEUTRAL_KARMA
