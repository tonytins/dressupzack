extends "res://scripts/clothing/baseClothing.gd"

onready var character = preload("res://resources/character.tres")
onready var clothing = $clothing

func _on_undies_pressed():
	character.underwear = clothing.texture_normal
