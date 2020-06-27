# Anthony Wilcox licenses this file to you under the MPL license.
# See the LICENSE file in the project root for more information.
extends Node2D

enum ClothingLayer {
	TOPS,
	BOTTOMS,
	UNDIES,
	ACCESSORY,
}

# Default clothing
onready var bottoms_placeholder = load("res://sprites/clothes/bottoms_placeholder.png")
onready var tops_placeholder = load("res://sprites/clothes/tops_placeholder.png")
onready var accessories_placeholder = load("res://sprites/clothes/tops_placeholder.png")

onready var bottoms = $Character/Bottom
onready var tops = $Character/Top

# var UndiesBtn = load("res://scenes/Clothing.tscenes")
#
#func _init():
#	init_underwear()

func change_bottoms(new_bottom):
	bottoms_placeholder = new_bottom
	
	if new_bottom == null:
		bottoms.texture = bottoms_placeholder
		UserSettings.Bottoms = bottoms_placeholder
		
#	if undies == load("res://sprites/clothes/owo_censor.svg"):
#		change_undies(null)
		
	bottoms.texture = bottoms_placeholder
	UserSettings.Bottoms = bottoms_placeholder
	
func change_undies(new_undies):
	$Character/Undies.texture = new_undies
	UserSettings.Underwear = new_undies

func change_tops(new_top):
	tops_placeholder = new_top
	
	if new_top == null:
		tops.texture = tops_placeholder
		UserSettings.Tops = tops_placeholder
	
	tops.texture = tops_placeholder
	UserSettings.Tops = tops_placeholder
	
#func change_accessoires(new_accessory):
#	accessories_placeholder = new_accessory
#
#	if new_accessory == null:
#		accessory.texture = accessories_placeholder
#		UserSettings.Accessory = accessories_placeholder
#
#	accessory.texture = accessories_placeholder
#	UserSettings.Accessory = accessories_placeholder
	
#func init_underwear():
#	var undiesFile = File.new()
#	undiesFile.open("res://undies.json", undiesFile.READ)
#	var undiesJson = parse_json(undiesFile.get_as_text())
#
#	for object in undiesJson:
#		var underwear = UndiesBtn.instance()
#
#		underwear.texture = load(object.sprite)
#

func _process(delta):
	
	# Change clothes
	# ===========================================================
	
#	if $UI/Base/Wordrobe/Accessoires/AccsScroll/AccsGrid/CanonCam.is_pressed():
#		change_accessoires(load("res://sprites/clothes/camera.png"))
		
	if $UI/Base/Wordrobe/Pants/PantsScroll/PantsGrid/Jeans.is_pressed():
		change_bottoms(load("res://sprites/clothes/jeans.svg"))
	
	if $UI/Base/Wordrobe/Pants/PantsScroll/PantsGrid/Sweats.is_pressed():
		change_bottoms(load("res://sprites/clothes/sweat_pants.svg"))
		
	if $UI/Base/Wordrobe/Pants/PantsScroll/PantsGrid/BlueSkirt.is_pressed():
		change_bottoms(load("res://sprites/clothes/blue_skirt.svg"))
		
	if $UI/Base/Wordrobe/Pants/PantsScroll/PantsGrid/FormalSkirt.is_pressed():
		change_bottoms(load("res://sprites/clothes/formal_skirt.svg"))
	
	if $UI/Base/Wordrobe/Pants/PantsScroll/PantsGrid/BeatUpJeans.is_pressed():
		change_bottoms(load("res://sprites/clothes/beat_up_jeans.svg"))
	
	if $UI/Base/Wordrobe/Underwear/UndiesScroll/UndiesGrid/Briefs.is_pressed():
		change_undies(load("res://sprites/clothes/briefs.svg"))
		
	if $UI/Base/Wordrobe/Underwear/UndiesScroll/UndiesGrid/ZBriefs.is_pressed():
		change_undies(load("res://sprites/clothes/z_briefs.svg"))
		
	if $UI/Base/Wordrobe/Underwear/UndiesScroll/UndiesGrid/Fundosi.is_pressed():
		change_undies(load("res://sprites/clothes/fundosi.svg"))
		
	if $UI/Base/Wordrobe/Underwear/UndiesScroll/UndiesGrid/OwOCensor.is_pressed():
		change_bottoms(null)
		change_undies(load("res://sprites/clothes/owo_censor.svg"))
		
		
	if $UI/Base/Wordrobe/Pants/PantsScroll/PantsGrid/BlueCamoJeans.is_pressed():
		change_bottoms(load("res://sprites/clothes/blue_camo_jeans.svg"))
		
	if $UI/Base/Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/TrainHoodie.is_pressed():
		change_tops(load("res://sprites/clothes/train_hoodie.svg"))
		
	if $UI/Base/Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/Sweatshirt.is_pressed():
		change_tops(load("res://sprites/clothes/old_sweatshirt.svg"))
		
	if $UI/Base/Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/Raw.is_pressed():
		change_tops(load("res://sprites/clothes/raw_shirt.svg"))
		
	if $UI/Base/Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/ZShirt.is_pressed():
		change_tops(load("res://sprites/clothes/z_shirt.png"))
		
	if $UI/Base/Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/WhatsNewShirt.is_pressed():
		change_tops(load("res://sprites/clothes/whatsnew_shirt.svg"))
		
	if $UI/Base/Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/Retro.is_pressed():
		change_tops(load("res://sprites/clothes/retro_shirt.svg"))
		
	if $UI/Base/Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/KormShirt.is_pressed():
		change_tops(load("res://sprites/clothes/korm_shirt.png"))
		
	if $UI/Base/Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/BikerJacket.is_pressed():
		change_tops(load("res://sprites/clothes/biker_jacket.svg"))
		
	if $UI/Base/Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/Atomic.is_pressed():
		change_tops(load("res://sprites/clothes/atomic_shirt.svg"))
		
	if $UI/Base/Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/NLJacket.is_pressed():
		change_tops(load("res://sprites/clothes/nl_jacket.png"))
		
	# Remove clothes
	# ===========================================================
	
#	if $UI/Base/Wordrobe/Accessoires/AccsScroll/AccsGrid/RemoveAccessory.is_pressed():
#		change_accessoires(null)
		
	if $UI/Base/Wordrobe/Shirts/ShirtsScroll/ShirtsGrid/RemoveShirt.is_pressed():
		change_tops(null)
		
	if $UI/Base/Wordrobe/Pants/PantsScroll/PantsGrid/RemovePants.is_pressed():
		change_bottoms(null)
