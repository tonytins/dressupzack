extends "res://scripts/clothing/baseClothing.gd"

onready var character = preload("res://resources/character.tres")

func _on_accessory_pressed():
	character.accessory = texture_normal
