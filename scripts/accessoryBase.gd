extends "res://scripts/baseClothing.gd"

onready var character = preload("res://resources/character.tres")
onready var clothing = $clothing

func _on_accessory_pressed():
	character.accessory = clothing.texture_normal
