extends "res://src/GameKit.gd"

func _process(delta):
	
	if $MenuPanel/TitleScreenBtn.is_pressed():
		switch_scenes("title")