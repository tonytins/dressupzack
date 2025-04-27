extends Node

var player_data: Dictionary = {
	"outfit": 0,
	"top": 0,
	"bottom": 0
}

func config_file(read_cfg = "user://config.cfg"):
	# If the game is in 
	if OS.is_debug_build():
		return "res://config.cfg"
	else:
		return read_cfg

func _json_tools(get_json: String):
	var json = JSON.new()
	var err = json.parse(get_json)
	if err == OK:
		var json_data = json.data
		return json_data
	else:
		print_debug("Unable to read data")
		pass

func save_file(save_json = "user://save.cfg", new_format = false):
	match new_format:
		true:
			pass
		false:
			# If the game is in 
			if OS.is_debug_build():
				return "res://save.cfg"
			else:
				return save_json

func save_config(save_cfg = "user://config.cfg"):
	
	
	# Create new ConfigFile object.
	var config = ConfigFile.new()
	
	var window_size = "display/window/size/";
	var default_width = ProjectSettings.get_setting(window_size + "viewport_width")
	var default_height = ProjectSettings.get_setting(window_size + "viewport_height")
	
	# If Retina display, set a higher resolution
	var display_scale = DisplayServer.screen_get_scale();
	match display_scale:
		2:
			config.set_value("window", "width", default_width * display_scale + 1)
			config.set_value("window", "height", default_height * display_scale + 1)
		1, _:
			config.set_value("window", "width", default_width)
			config.set_value("window", "height", default_height)

	# Save it to a file (overwrite if already exists)
	if !FileAccess.file_exists(save_cfg):
		config.save(save_cfg)
		
func save_game(tops = 0, bottoms = 0, outfits = 0, json_file = "user://save.cfg", overwrite = false, new_format = false):
	match new_format:
		true:
			pass
		false:
			print_debug("Saving .cfg format.")
			# Create new ConfigFile object.
			var config = ConfigFile.new()
			
			# Store some values.
			config.set_value("clothes", "tops", tops)
			config.set_value("clothes", "bottoms", bottoms)
			config.set_value("clothes", "outfits", outfits)

			# Save it to a file (overwrite if already exists)
			if !FileAccess.file_exists(json_file) || overwrite == true:
				config.save(json_file)
	
func load_config(section, value, load_cfg = "user://config.cfg"):
	var config = ConfigFile.new()

	# Load data from a file.
	var err = config.load(load_cfg)

	# If the file didn't load, ignore it.
	if err != OK:
		return
		
	for cfg in config.get_sections():
		return config.get_value(section, value)
