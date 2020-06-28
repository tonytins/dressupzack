extends "res://scripts/clothing/baseClothing.gd"

func _on_accessory_pressed():
	character.accessory = texture_normal
	$select.play()
