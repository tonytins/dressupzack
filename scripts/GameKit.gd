# Anthony Wilcox licenses this file to you under the MPL license.
# See the LICENSE file in the project root for more information.
extends Node

var version = "2.0"

func _ready():
	randomize()

func is_game_paused(is_paused):
	if is_paused == true:
		get_tree().paused = true
	else:
		get_tree().paused = false
		
func switch_scenes(new_mode):
	if new_mode == "classic":
		get_tree().change_scene("res://scenes/ClassicScn.tscn")
	elif new_mode == "credits":
		get_tree().change_scene("res://scenes/CreditsScn.tscn")
	elif new_mode == "play":
		get_tree().change_scene("res://scenes/GameScn.tscn")
	elif new_mode == "title":
		get_tree().change_scene("res://scenes/TitleScn.tscn")
		
func if_file_exists(file):
	var fileCheck = File.new()
	var fileExists = fileCheck.file_exists(file)
	fileCheck
