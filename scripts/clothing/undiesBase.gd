extends "res://scripts/clothing/baseClothing.gd"

func _on_undies_pressed():
	character.underwear = texture_normal
	$select.play()
