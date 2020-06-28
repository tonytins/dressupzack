extends "res://scripts/clothing/baseClothing.gd"

func _on_bottoms_pressed():
	character.bottom = texture_normal
	$select.play()
