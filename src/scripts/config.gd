extends Node

func config_file(config_file = "user://config.cfg"):
	# If the game is in 
	if OS.is_debug_build():
		print_debug("Loading local config file")
		return "res://config.cfg"
	else:
		return config_file
		
func save_file(save_file = "user://save.cfg"):
	# If the game is in 
	if OS.is_debug_build():
		print_debug("Loading local save file")
		return "res://save.cfg"
	else:
		return save_file

func save_config(config_file = "user://config.cfg"):
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
	if !FileAccess.file_exists(config_file):
		config.save(config_file)
		
func save_game(tops = 0, bottoms = 0, outfits = 0, save_file = "user://save.cfg", overwrite = false):
	# Create new ConfigFile object.
	var config = ConfigFile.new()
	
	# Store some values.
	config.set_value("clothes", "tops", tops)
	config.set_value("clothes", "bottoms", bottoms)
	config.set_value("clothes", "outfits", outfits)

	# Save it to a file (overwrite if already exists)
	if !FileAccess.file_exists(save_file) || overwrite == true:
		config.save(save_file)
	
func load_config(section, value, config_file = "user://config.cfg"):
	var config = ConfigFile.new()

	# Load data from a file.
	var err = config.load(config_file)

	# If the file didn't load, ignore it.
	if err != OK:
		return
		
	for cfg in config.get_sections():
		return config.get_value(section, value)
