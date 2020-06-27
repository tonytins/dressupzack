extends "res://scripts/clothing/baseClothing.gd"

onready var character = preload("res://resources/character.tres")

func _on_undies_pressed():
	character.underwear = texture_normal
