extends "res://scripts/clothing/clothing_base.gd"

func _on_undies_pressed():
	character.underwear = texture_normal
	$select.play()
