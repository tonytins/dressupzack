# Anthony Wilcox licenses this file to you under the MPL license.
# See the LICENSE file in the project root for more information.
extends Node2D

onready var undies = $Character/Undies
onready var bottoms = $Character/Bottom
onready var tops = $Character/Top
onready var accesories = $Character/Accessory

func _process(delta):
	
	if undies.texture != null:
		undies.texture = UserSettings.Underwear
		
	if bottoms.texture != null:
		bottoms.texture = UserSettings.Bottoms
	
	if tops.texture != null:
		tops.texture = UserSettings.Tops
	
	if accesories.texture != null:
		accesories.texture = UserSettings.Accessory
	
