extends Node

func debug_config():
	# If the game is in 
	if OS.is_debug_build():
		return "res://config.cfg"
	else:
		return "user://config.cfg"

func set_config(config_file = "user://config.cfg"):
	# Create new ConfigFile object.
	var config = ConfigFile.new()

	# Store some values.
	config.set_value("window", "height", 1024)
	config.set_value("window", "width", 768)

	# Save it to a file (overwrite if already exists)
	if !FileAccess.file_exists(config_file):
		config.save(config_file)
	
func get_config(section, value, config_file = "user://config.cfg"):
	var config = ConfigFile.new()

	# Load data from a file.
	var err = config.load(config_file)

	# If the file didn't load, ignore it.
	if err != OK:
		return
		
	for cfg in config.get_sections():
		return config.get_value(section, value)
