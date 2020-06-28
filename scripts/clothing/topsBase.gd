extends "res://scripts/clothing/baseClothing.gd"

func _on_tops_pressed():
	character.top = texture_normal
	$select.play()
