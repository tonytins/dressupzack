extends TabContainer

onready var character = preload("res://resources/character.tres")
onready var blank_top = preload("res://sprites/clothes/blank_top.png")
onready var blank_bottom = preload("res://sprites/clothes/blank_bottom.png")

onready var pants_grid = $Pants/PantsScroll/PantsGrid
onready var shirts_grid = $Shirts/ShirtsScroll/ShirtsGrid
onready var undies_grid = $Underwear/UndiesScroll/UndiesGrid
onready var accs_grid = $Accessoires/AccsScroll/AccsGrid

func _ready():
	var load_pck = ProjectSettings.load_resource_pack("user://dlc/pack.pck")
	
	if load_pck == true:
		# All the button scenes are consolidated 
		# in a root scene and and each parent 
		# is instanced to their respective grid
		var import_scene = load("res://scenes/dlc/pants.tscn")
			
func _on_removeAccessory_pressed():
	character.accessory = blank_top

func _on_removePants_pressed():
	character.bottom = blank_bottom

func _on_removeShirt_pressed():
	character.top = blank_top
