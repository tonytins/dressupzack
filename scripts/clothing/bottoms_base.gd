extends "res://scripts/clothing/clothing_base.gd"

func _on_bottoms_pressed():
	character.bottom = texture_normal
	$select.play()
