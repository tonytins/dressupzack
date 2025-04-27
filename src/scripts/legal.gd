extends Node

func _ready() -> void:
	var config_file = Config.config_file()
	
	if FileAccess.file_exists(config_file):
		var window_section = "window"
		var window_height = Config.load_config(window_section, "height", config_file)
		var window_width = Config.load_config(window_section, "width", config_file)
		var viewport = get_viewport();
		
		# Set window size
		DisplayServer.window_set_size(Vector2i(window_width, window_height))

func _on_exit_btn_pressed() -> void:
	get_tree().quit()

func _on_back_btn_pressed() -> void:
	var game_scene = "res://src/scenes/game.tscn";
	ResourceLoader.load_threaded_request(game_scene)
	get_tree().change_scene_to_file(game_scene)
