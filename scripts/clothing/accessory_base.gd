extends "res://scripts/clothing/clothing_base.gd"

func _on_accessory_pressed():
	character.accessory = texture_normal
	$select.play()
