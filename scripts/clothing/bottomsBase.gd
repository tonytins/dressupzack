extends "res://scripts/clothing/baseClothing.gd"

onready var character = preload("res://resources/character.tres")

func _on_bottoms_pressed():
	character.bottom = texture_normal
