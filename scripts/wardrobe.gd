extends TabContainer

onready var character = preload("res://resources/character.tres")
onready var blank_top = preload("res://sprites/clothes/blank_top.png")
onready var blank_bottom = preload("res://sprites/clothes/blank_bottom.png")

onready var pants_grid = $Pants/PantsScroll/PantsGrid
onready var shirts_grid = $Shirts/ShirtsScroll/ShirtsGrid
onready var undies_grid = $Underwear/UndiesScroll/UndiesGrid
onready var accs_grid = $Accessoires/AccsScroll/AccsGrid

func _ready():
	var dlc_pack = "user://dlc/testdlc.pck"
	var load_pck = ProjectSettings.load_resource_pack(dlc_pack, false)
	if load_pck == true:
		ProjectSettings.load_resource_pack(dlc_pack, false)
		var dir = Directory.new()
		if dir.open("res://scenes/dlc/shirts") == OK:
			dir.list_dir_begin()
			var shirts = dir.get_next()
			while shirts != "":
				var shirt = "res://scenes/dlc/shirts/" + shirts
				var inst = load(shirt).instance()
				shirts_grid.add_child(inst)
				inst.set_owner(self)
				
#			var import_scene = load(shirts).instance()
#			shirts_grid.add_child(import_scene)
#	if dir.open("user://dlc") == OK:
#		print_debug(OS.get_user_data_dir())
#		dir.list_dir_begin()
#		var load_pcks = ProjectSettings.load_resource_pack(dir.get_next(), false)
#		if load_pcks == true:
#			if dir.change_dir("res://scenes/dlc/shirts") == OK:
#				var file_name = dir.get_next()
#				print_debug("loaded:" + file_name)
#				if dir.current_is_dir() == "shirts":
#					var shirt_dlc = load(dir.get_next())
#					shirts_grid.get_children(shirt_dlc)
			
func _on_removeAccessory_pressed():
	character.accessory = blank_top

func _on_removePants_pressed():
	character.bottom = blank_bottom

func _on_removeShirt_pressed():
	character.top = blank_top
