# This project is licensed under the MPL license.
# See the LICENSE file in the project root for more information.
extends "res://scripts/clothing/clothing_base.gd"

func _on_accessory_pressed():
	character.accessory = texture_normal
	$select.play()
