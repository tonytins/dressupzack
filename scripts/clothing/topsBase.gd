extends "res://scripts/clothing/baseClothing.gd"

onready var character = preload("res://resources/character.tres")

func _on_tops_pressed():
	character.top = texture_normal
