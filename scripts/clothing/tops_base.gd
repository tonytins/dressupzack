extends "res://scripts/clothing/clothing_base.gd"

func _on_tops_pressed():
	character.top = texture_normal
	$select.play()
