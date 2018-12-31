extends Control

onready var coming_soon_win = preload("res://windows/ComingSoon.tscn") 
onready var about_win = preload("res://windows/About.tscn")

func _on_ScreenshotBtn_pressed():
	var win_instance = coming_soon_win.instance()
	add_child(win_instance)

func _on_AboutBtn_pressed():
	var win_instance = about_win.instance()
	add_child(win_instance)
