extends TabContainer

onready var character = preload("res://resources/character.tres")
onready var blank_top = preload("res://sprites/clothes/blank_top.png")
onready var blank_bottom = preload("res://sprites/clothes/blank_bottom.png")

func _on_removeAccessory_pressed():
	character.accessory = blank_top

func _on_removePants_pressed():
	character.bottom = blank_bottom

func _on_removeShirt_pressed():
	character.top = blank_top
