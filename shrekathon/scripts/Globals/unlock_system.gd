extends Node

var resultList: Array[int] = [false, false, false]
var badCount = 0

var isEndingMenu = false

var obtainedHorizontalDash: bool:
	get:
		return resultList[0]
	set(value):
		if value == false:
			badCount += 1
		resultList[0] = value

var obtainedVerticalDash: bool:
	get:
		return resultList[1]
	set(value):
		if value == false:
			badCount += 1
		resultList[1] = value

var obtainedJumpExtend: bool:
	get:
		return resultList[2]
	set(value):
		if value == false:
			badCount += 1
		resultList[2] = value


var can_move = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

#for good end
func is_good_ending() -> bool:
	for value in resultList:
		if not value:
			return false
	return true

#for bad end
func is_bad_ending() -> bool:
	for value in resultList:
		if value:
			return false
	if badCount >= 3:		
		return true
	else:
		return false

#for neither
func is_neutral_ending() -> bool:
	return not is_good_ending() and not is_bad_ending()
