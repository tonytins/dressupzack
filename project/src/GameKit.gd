# Anthony Wilcox licenses this file to you under the GPL license.
# See the LICENSE file in the project root for more information.
extends Node

var version = "19.xx"

func is_game_paused(is_paused):
	if is_paused == true:
		get_tree().paused = true
	else:
		get_tree().paused = false
		
func switch_scenes(new_mode):
	if new_mode == "classic":
		get_tree().change_scene("res://scn/ClassicScn.tscn")
	elif new_mode == "credits":
		get_tree().change_scene("res://scn/CreditsScn.tscn")
	elif new_mode == "play":
		get_tree().change_scene("res://scn/GameScn.tscn")
	elif new_mode == "title":
		get_tree().change_scene("res://scn/TitleScn.tscn")