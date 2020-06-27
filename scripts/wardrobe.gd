extends TabContainer

onready var character = preload("res://resources/character.tres")
onready var blank_top = preload("res://sprites/clothes/tops_placeholder.png")

func _on_removeAccessory_pressed():
	character.accessory = blank_top
