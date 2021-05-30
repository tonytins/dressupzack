# This project is licensed under the MPL license.
# See the LICENSE file in the project root for more information.
extends TabContainer

onready var character = preload("res://resources/character.tres")
onready var blank_accessory = preload("res://sprites/clothes/blank_top.png")
onready var base_top = preload("res://sprites/character/character_base_top.svg")
onready var base_bottom = preload("res://sprites/clothes/owo_censor.svg")

onready var pants_grid = $Pants/PantsScroll/PantsGrid
onready var shirts_grid = $Shirts/ShirtsScroll/ShirtsGrid
#onready var undies_grid = $Underwear/UndiesScroll/UndiesGrid
onready var accs_grid = $Accessoires/AccsScroll/AccsGrid

func list_files_in_directory(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)

	dir.list_dir_end()

	return files

func load_dlc(dlc_pack):
	var usr_dir = "user://dlc/"
	var dlc_path = usr_dir + dlc_pack
	var load_pck = ProjectSettings.load_resource_pack(dlc_path, false)
	print_debug("Loaded " + dlc_path + ": " + str(load_pck))
	
	# Check if the DLC is actually there
	if load_pck == true:
		
		# Loads the DLC
		ProjectSettings.load_resource_pack(dlc_path, false)
		
		var dir = Directory.new()
		dir.list_dir_begin()
		
		# Lists the files in each of their respective directories
		var shirts_dir = "res://scenes/dlc/shirts/"
		var pants_dir = "res://scenes/dlc/pants/"
		var dlc_shirts = list_files_in_directory(shirts_dir)
		var dlc_pants = list_files_in_directory(pants_dir)
		
		# Make sure each file actually exist, instance them
		# and add them to their respective tabs
		for shirt in dlc_shirts:
			if dir.file_exists(shirts_dir + shirt):
				var init = load(shirts_dir + shirt).instance()
				shirts_grid.add_child(init)
				print_debug("Initialized: " + shirts_dir + shirt)
				
		for pants in dlc_pants:
			if dir.file_exists(pants_dir + pants):
				var init = load(pants_dir + pants).instance()
				shirts_grid.add_child(init)
				print_debug("Initialized: " + pants_dir + pants)

func _ready():
	load_dlc("emojidlc.pck")
	pass
			
func _on_removeAccessory_pressed():
	character.accessory = blank_accessory

func _on_removePants_pressed():
	character.bottom = base_bottom

func _on_removeShirt_pressed():
	character.top = base_top
