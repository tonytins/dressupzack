# Anthony Wilcox licenses this file to you under the GPL license.
# See the LICENSE file in the project root for more information.
extends Control

onready var coming_soon_win = preload("res://windows/ComingSoon.tscn") 
onready var about_win = preload("res://windows/About.tscn")
onready var credits_win = preload("res://windows/Credits.tscn")

func _on_AboutBtn_pressed():
	var win_instance = about_win.instance()
	add_child(win_instance)


func _on_CreditsBtn_pressed():
	var win_instance = credits_win.instance()
	add_child(win_instance)

func _on_MusicBtn_toggled(button_pressed):
	if button_pressed == true:
		$Music.play()
	else:
		$Music.stop()
