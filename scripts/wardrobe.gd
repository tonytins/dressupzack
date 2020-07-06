extends TabContainer

onready var character = preload("res://resources/character.tres")
onready var blank_top = preload("res://sprites/clothes/blank_top.png")
onready var blank_bottom = preload("res://sprites/clothes/blank_bottom.png")

onready var pants_grid = $Pants/PantsScroll/PantsGrid
onready var shirts_grid = $Shirts/ShirtsScroll/ShirtsGrid
onready var undies_grid = $Underwear/UndiesScroll/UndiesGrid
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

func check_for_dlc(dlc_pack):
	var usr_dir = "user://dlc/"
	var dlc_path = usr_dir + dlc_pack
	var load_pck = ProjectSettings.load_resource_pack(dlc_path, false)
	print_debug("Loaded " + dlc_path + ": " + str(load_pck))
	
	# Check if the DLC is actually there
	if load_pck == true:
		# Load the DLC
		ProjectSettings.load_resource_pack(dlc_path, false)
		
		# Locates 
		var dir = Directory.new()
		dir.list_dir_begin()
		var shirts_dir = "res://scenes/dlc/shirts/"
		var pants_dir = "res://scenes/dlc/pants/"
		var undies_dir = "res://scenes/dlc/undies/"
		var dlc_shirts = list_files_in_directory(shirts_dir)
		var dlc_pants = list_files_in_directory(pants_dir)
		var dlc_undies = list_files_in_directory(undies_dir)
		
		# Initialize and add nodes from each tab
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
	
		for undies in dlc_undies:
			if dir.file_exists(undies_dir + undies):
				var init = load(undies_dir + undies).instance()
				shirts_grid.add_child(init)
				print_debug("Initialized: " + undies_dir + undies)

func _ready():
#	check_for_dlc("testdlc.pck")
	pass
			
func _on_removeAccessory_pressed():
	character.accessory = blank_top

func _on_removePants_pressed():
	character.bottom = blank_bottom

func _on_removeShirt_pressed():
	character.top = blank_top
