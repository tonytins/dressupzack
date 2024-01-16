extends Node


@onready var tops = $Tops
@onready var bottoms = $Bottoms


func _ready():
	var config_file = Config.debug_config()
		
	if !FileAccess.file_exists(config_file):
		Config.set_config()
	
	if FileAccess.file_exists(config_file):
		var window_height = Config.get_config("window", "height", config_file)
		var window_width = Config.get_config("window", "width", config_file)
		print_debug(window_height)
		print_debug(window_width)
		
		if window_height && window_width != null:
			DisplayServer.window_set_size(Vector2i(window_height, window_width))

func _on_tops_fwd_btn_pressed():
	var current_frame = tops.frame
	tops.frame = current_frame + 1;

func _on_tops_bck_btn_pressed():
	var current_frame = tops.frame
	tops.frame = current_frame + -1;


func _on_bottoms_bck_btn_pressed():
	var current_frame = bottoms.frame
	bottoms.frame = current_frame + -1;


func _on_bottoms_fwd_btn_pressed():
	var current_frame = bottoms.frame
	bottoms.frame = current_frame + 1;


func _on_fullbody_btn_pressed():
	pass # Replace with function body.


func _on_separate_btn_pressed():
	pass # Replace with function body.
