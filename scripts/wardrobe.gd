extends TabContainer

onready var character = preload("res://resources/character.tres")
onready var blank_top = preload("res://sprites/clothes/blank_top.png")
onready var blank_bottom = preload("res://sprites/clothes/blank_bottom.png")

onready var pants_grid = $Pants/PantsScroll/PantsGrid
onready var shirts_grid = $Shirts/ShirtsScroll/ShirtsGrid
onready var undies_grid = $Underwear/UndiesScroll/UndiesGrid
onready var accs_grid = $Accessoires/AccsScroll/AccsGrid

func _ready():
	var dir = Directory.new()
	
	if dir.open("user://dlc") == OK:
		dir.list_dir_begin()
		if "pck" in dir.get_next() == true:
			var load_pcks = ProjectSettings.load_resource_pack(dir.get_next(), false)
			if load_pcks == true:
				if dir.open("res://scenes/dlc") == OK:
					var file_name = dir.get_next()
					dir.change_dir("shirts")
					if dir.current_is_dir() == "shirts":
						var shirt_dlc = load(dir.get_next())
						shirts_grid.get_children(shirt_dlc)
			
func _on_removeAccessory_pressed():
	character.accessory = blank_top

func _on_removePants_pressed():
	character.bottom = blank_bottom

func _on_removeShirt_pressed():
	character.top = blank_top
