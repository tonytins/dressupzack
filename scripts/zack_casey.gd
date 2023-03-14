# This project is licensed under the Artistic-2.0 license.
# See the LICENSE file in the project root for more information.
extends Node2D

const _TDU_VERSION = "0.2"
const _SAVE_FILE = "user://character.tdu"

@onready var blank_accessory = preload("res://sprites/clothes/blank_top.png")
@onready var base_top = preload("res://sprites/character/character_base_top.svg")
@onready var base_bottom = preload("res://sprites/character/character_base_legs.svg")

@onready var export_win = $Controls/Container/ExportWin
@onready var import_win = $Controls/Container/ImportWin

@onready var accessory = $Body/Accessory
#onready var underwear = $Undies
@onready var bottom = $Body/Legs
@onready var top = $Body/Top
# onready var eyes = $Body/Head/Eyes
# onready var mouth = $Body/Head/Mouth

func _process(delta):
	
	if GameData.accessory != null:
		accessory.texture = GameData.accessory
		
#	if GameData.underwear != null:
#		underwear.texture = GameData.underwear
	
	if GameData.bottom != null:
		bottom.texture = GameData.bottom
		
	if GameData.top != null:
		top.texture = GameData.top

func _on_clearBtn_pressed():
	$Click.play()
	GameData.accessory = blank_accessory
	GameData.bottom = base_bottom
	GameData.top = base_top
