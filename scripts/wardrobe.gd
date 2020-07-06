extends TabContainer

onready var character = preload("res://resources/character.tres")
onready var blank_top = preload("res://sprites/clothes/blank_top.png")
onready var blank_bottom = preload("res://sprites/clothes/blank_bottom.png")

onready var pants_grid = $Pants/PantsScroll/PantsGrid
onready var shirts_grid = $Shirts/ShirtsScroll/ShirtsGrid
onready var undies_grid = $Underwear/UndiesScroll/UndiesGrid
onready var accs_grid = $Accessoires/AccsScroll/AccsGrid

func get_dlc(dlc_pack, scenes: Array):
	var usr_dir = "user://dlc/"
	var dlc_path = usr_dir + dlc_pack
	var load_pck = ProjectSettings.load_resource_pack(dlc_path, false)
	print_debug("Loaded " + dlc_path + ": " + str(load_pck))
	
	# Check if the DLC is actually there
	if load_pck == true:
		# Load the DLC
		ProjectSettings.load_resource_pack(dlc_path, false)
		
		# Initialize and add nodes from each tab 
		for scene in scenes:
			var dlc_scene = "res://scenes/dlc/" + scene
			var init = load(dlc_scene).instance()
			
			if "shirts" in scene:
				shirts_grid.add_child(init)
				print_debug("Initialized: " + dlc_scene)
				
			if "pants" in scene:
				pants_grid.add_child(init)
				print_debug("Initialized: " + dlc_scene)

func _ready():
	get_dlc("testdlc.pck", ["shirts/TestShirts.tscn"])
			
func _on_removeAccessory_pressed():
	character.accessory = blank_top

func _on_removePants_pressed():
	character.bottom = blank_bottom

func _on_removeShirt_pressed():
	character.top = blank_top
