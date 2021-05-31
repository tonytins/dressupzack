# This project is licensed under the Artistic-2.0 license.
# See the LICENSE file in the project root for more information.
extends Node2D

const _TDU_VERSION = "0.2"
const _SAVE_FILE = "user://character.tdu"

onready var character = preload("res://resources/character.tres")
onready var blank_accessory = preload("res://sprites/clothes/blank_top.png")
onready var base_top = preload("res://sprites/character/character_base_top.svg")
onready var base_bottom = preload("res://sprites/character/character_base_legs.svg")

onready var accessory = $body/accessory
#onready var underwear = $Undies
onready var bottom = $body/legs
onready var top = $body/top
onready var eyes = $body/head/eyes
onready var mouth = $body/head/mouth

func _process(delta):
	
	if character.accessory != null:
		accessory.texture = character.accessory
		
#	if character.underwear != null:
#		underwear.texture = character.underwear
	
	if character.bottom != null:
		bottom.texture = character.bottom
		
	if character.top != null:
		top.texture = character.top

func save_game():
	var data_file = {
		"version": _TDU_VERSION,
		"game_ver": GameData.version,
		"accessory": "res://sprites/clothes/blank_top.png",
		"top": "res://sprites/clothes/blank_top.png",
		"bottom": "res://sprites/character/character_base_legs.svg",
	}
	
	data_file["accessory"] = accessory.texture.resource_path
	data_file["top"] = top.texture.resource_path
	data_file["bottom"] = bottom.texture.resource_path
	var file = File.new()
	if file.open(_SAVE_FILE, File.WRITE) != 0:
		print("Error opening file")
		return
	var json_file = to_json(data_file)
	file.store_line(json_file)
	print_debug(json_file)
	file.close()
	
func load_game():
	var file = File.new()
	
	if not file.file_exists(_SAVE_FILE):
		print("File not found!")
		return
	
	if file.open(_SAVE_FILE, File.READ) != 0:
		print("Error opening file")
		return
		
	var data = parse_json(file.get_line())
	
	var top_texture = ImageTexture.new()
	var accessory_texture = ImageTexture.new()
	var bottom_texture = ImageTexture.new()
	var top_image = Image.new()
	var accessory_image = Image.new()
	var bottom_image = Image.new()
	
	top_image.load(data["top"])
	top_texture.create_from_image(top_image)
	top.texture = top_texture

	bottom_image.load(data["bottom"])
	top_texture.create_from_image(top_image)
	bottom.texture = top_texture
	
	accessory_image.load(data["accessory"])
	accessory_texture.create_from_image(top_image)
	accessory.texture = accessory_texture
	
	file.close()

func _on_clearBtn_pressed():
	$Click.play()
	character.accessory = blank_accessory
	character.bottom = base_bottom
	character.top = base_top

func _on_SaveBtn_pressed():
	$Click.play()
	GameEvents.emit_signal("indicate")
	save_game()

func _on_LoadBtn_pressed():
	$Click.play()
	GameEvents.emit_signal("indicate")
	load_game()
