# Anthony Wilcox licenses this file to you under the MPL license.
# See the LICENSE file in the project root for more information.
extends Node

enum ClothingLayer {
	TOPS,
	BOTTOMS,
	UNDIES,
	ACCESSORY,
}

# Default clothing
onready var bottoms = load("res://sprites/bottoms_placeholder.png")
onready var tops = load("res://sprites/tops_placeholder.png")
onready var accessory = load("res://sprites/tops_placeholder.png")

var UndiesBtn = load("res://scn/Clothing.tscn")

func _init():
	init_underwear()

func change_bottoms(new_bottom):
	bottoms = new_bottom
	
	if new_bottom == null:
		$Character/Bottom.texture = bottoms
		UserSettings.Bottoms = bottoms
		
#	if undies == load("res://sprites/owo_censor.svg"):
#		change_undies(null)
		
	$Character/Bottom.texture = bottoms
	UserSettings.Bottoms = bottoms
	
func change_undies(new_undies):
	$Character/Undies.texture = new_undies
	UserSettings.Underwear = new_undies

func change_tops(new_top):
	tops = new_top
	
	if new_top == null:
		$Character/Top.texture = tops
		UserSettings.Tops = tops
	
	$Character/Top.texture = tops
	UserSettings.Tops = tops
	
func change_accessoires(new_accessory):
	accessory = new_accessory
	
	if new_accessory == null:
		$Character/Accessory.texture = accessory
		UserSettings.Accessory = accessory
	
	$Character/Accessory.texture = accessory
	UserSettings.Accessory = accessory
	
func init_underwear():
	var undiesFile = File.new()
	undiesFile.open("res://undies.json", undiesFile.READ)
	var undiesJson = parse_json(undiesFile.get_as_text())
	
	for object in undiesJson:
		var underwear = UndiesBtn.instance()
		
		underwear.texture = load(object.sprite)
		

# warning-ignore:unused_argument
func _process(delta):
	
	# Change clothes
	# ===========================================================
	
	if $Wordrobe/Accessoires/AccsScroll/AccsGrid/CanonCam.is_pressed():
		change_accessoires(load("res://sprites/camera.png"))
		
	if $Wordrobe/Pants/PantsScroll/PantsGrid/Jeans.is_pressed():
		change_bottoms(load("res://sprites/jeans.svg"))
	
	if $Wordrobe/Pants/PantsScroll/PantsGrid/Sweats.is_pressed():
		change_bottoms(load("res://sprites/sweat_pants.svg"))
		
	if $Wordrobe/Pants/PantsScroll/PantsGrid/BlueSkirt.is_pressed():
		change_bottoms(load("res://sprites/blue_skirt.svg"))
		
	if $Wordrobe/Pants/PantsScroll/PantsGrid/FormalSkirt.is_pressed():
		change_bottoms(load("res://sprites/formal_skirt.svg"))
	
	if $Wordrobe/Pants/PantsScroll/PantsGrid/BeatUpJeans.is_pressed():
		change_bottoms(load("res://sprites/beat_up_jeans.svg"))
	
	if $Wordrobe/Underwear/UndiesScroll/UndiesGrid/Briefs.is_pressed():
		change_undies(load("res://sprites/briefs.svg"))
		
	if $Wordrobe/Underwear/UndiesScroll/UndiesGrid/ZBriefs.is_pressed():
		change_undies(load("res://sprites/z_briefs.svg"))
		
	if $Wordrobe/Underwear/UndiesScroll/UndiesGrid/Fundosi.is_pressed():
		change_undies(load("res://sprites/fundosi.svg"))
		
	if $Wordrobe/Underwear/UndiesScroll/UndiesGrid/OwOCensor.is_pressed():
		change_bottoms(null)
		change_undies(load("res://sprites/owo_censor.svg"))
		
		
	if $Wordrobe/Pants/PantsScroll/PantsGrid/BlueCamoJeans.is_pressed():
		change_bottoms(load("res://sprites/blue_camo_jeans.svg"))
		
	if $Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/TrainHoodie.is_pressed():
		change_tops(load("res://sprites/train_hoodie.svg"))
		
	if $Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/Sweatshirt.is_pressed():
		change_tops(load("res://sprites/old_sweatshirt.svg"))
		
	if $Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/Raw.is_pressed():
		change_tops(load("res://sprites/raw_shirt.svg"))
		
	if $Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/ZShirt.is_pressed():
		change_tops(load("res://sprites/z_shirt.png"))
		
	if $Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/WhatsNewShirt.is_pressed():
		change_tops(load("res://sprites/whatsnew_shirt.svg"))
		
	if $Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/Retro.is_pressed():
		change_tops(load("res://sprites/retro_shirt.svg"))
		
	if $Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/KormShirt.is_pressed():
		change_tops(load("res://sprites/korm_shirt.png"))
		
	if $Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/BikerJacket.is_pressed():
		change_tops(load("res://sprites/biker_jacket.svg"))
		
	if $Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/Atomic.is_pressed():
		change_tops(load("res://sprites/atomic_shirt.svg"))
		
	if $Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/NLJacket.is_pressed():
		change_tops(load("res://sprites/nl_jacket.png"))
		
	# Remove clothes
	# ===========================================================
	
	if $Wordrobe/Accessoires/AccsScroll/AccsGrid/RemoveAccessory.is_pressed():
		change_accessoires(null)
		
	if $Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/RemoveShirt.is_pressed():
		change_tops(null)
		
	if $Wordrobe/Pants/PantsScroll/PantsGrid/RemovePants.is_pressed():
		change_bottoms(null)