# Anthony Wilcox licenses this file to you under the MPL license.
# See the LICENSE file in the project root for more information.
extends Node2D

onready var character = preload("res://resources/character.tres")
onready var accessory = $Accessory

func _process(delta):
	if character.accessory != null:
		accessory.texture = character.accessory
