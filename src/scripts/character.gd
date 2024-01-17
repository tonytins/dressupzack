extends Node2D

@onready var _eyes = $Eyes
@onready var _tail = $Tail
@onready var _mouth = $Mouth

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_eyes.play("default")
	_tail.play("default")
	_mouth.play("default")
