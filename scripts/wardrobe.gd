# This project is licensed under the Artistic-2.0 license.
# See the LICENSE file in the project root for more information.
extends TabContainer

@onready var character = preload("res://resources/character.tres")
@onready var blank_accessory = preload("res://sprites/clothes/blank_top.png")
@onready var base_top = preload("res://sprites/character/character_base_top.svg")
@onready var base_bottom = preload("res://sprites/clothes/owo_censor.svg")

@onready var pants_grid = $Pants/PantsScroll/PantsGrid
@onready var shirts_grid = $Shirts/ShirtsScroll/ShirtsGrid
#onready var undies_grid = $Underwear/UndiesScroll/UndiesGrid
@onready var accs_grid = $Accessoires/AccsScroll/AccsGrid
		
func _on_removeAccessory_pressed():
	character.accessory = blank_accessory

func _on_removePants_pressed():
	character.bottom = base_bottom

func _on_removeShirt_pressed():
	character.top = base_top
