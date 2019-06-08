# Anthony Wilcox licenses this file to you under the GPL license.
# See the LICENSE file in the project root for more information.
extends "res://src/GameKit.gd"

# Default clothing
onready var bottoms = load("res://sprites/bottoms_placeholder.png")
onready var tops = load("res://sprites/tops_placeholder.png")
onready var accessory = load("res://sprites/tops_placeholder.png")
# ZC's Dress Up was stylized to be cute, not adult.
# Underwear cam be suggestive but never lewd. 
onready var undies = load("res://sprites/briefs.svg")

func change_bottoms(new_bottom):
	bottoms = new_bottom
	
	if new_bottom == null:
		$Nathan/Bottom.texture = bottoms
		
	if undies == load("res://sprites/owo_censor.svg"):
		change_undies(null)
		
	$Nathan/Bottom.texture = bottoms
	
func change_undies(new_undies):
	undies = new_undies
	$Nathan/Undies.texture = undies

func change_tops(new_top):
	tops = new_top
	
	if new_top == null:
		$Nathan/Top.texture = tops
	
	$Nathan/Top.texture = tops
	
func change_accessoires(new_accessory):
	accessory = new_accessory
	
	if new_accessory == null:
		$Nathan/Accessory.texture = accessory
	
	$Nathan/Accessory.texture = accessory

# warning-ignore:unused_argument
func _process(delta):
	
	# Change clothes
	# ===========================================================
	
	if $Clothes/Wordrobe/Accessoires/AccsGrid/CanonCam.is_pressed():
		change_accessoires(load("res://sprites/camera.png"))
		
	if $Clothes/Wordrobe/Pants/PantsGrid/Jeans.is_pressed():
		change_bottoms(load("res://sprites/jeans.svg"))
	
	if $Clothes/Wordrobe/Pants/PantsGrid/Sweats.is_pressed():
		change_bottoms(load("res://sprites/sweat_pants.svg"))
	
	if $Clothes/Wordrobe/Pants/PantsGrid/BeatUpJeans.is_pressed():
		change_bottoms(load("res://sprites/beat_up_jeans.svg"))
	
	if $Clothes/Wordrobe/Underwear/UndiesGrid/Briefs.is_pressed():
		change_undies(load("res://sprites/briefs.svg"))
		
	if $Clothes/Wordrobe/Underwear/UndiesGrid/ZBriefs.is_pressed():
		change_undies(load("res://sprites/z_briefs.svg"))
		
	if $Clothes/Wordrobe/Underwear/UndiesGrid/Fundosi.is_pressed():
		change_undies(load("res://sprites/fundosi.svg"))
		
	if $Clothes/Wordrobe/Underwear/UndiesGrid/OwOCensor.is_pressed():
		change_bottoms(null)
		change_undies(load("res://sprites/owo_censor.svg"))
		
		
	if $Clothes/Wordrobe/Pants/PantsGrid/BlueCamoJeans.is_pressed():
		change_bottoms(load("res://sprites/blue_camo_jeans.svg"))
		
	if $Clothes/Wordrobe/Shirts/ShirtsGrid/TrainHoodie.is_pressed():
		change_tops(load("res://sprites/train_hoodie.svg"))
		
	if $Clothes/Wordrobe/Shirts/ShirtsGrid/Sweatshirt.is_pressed():
		change_tops(load("res://sprites/old_sweatshirt.svg"))
		
	# Remove clothes
	# ===========================================================
	
	if $Clothes/Wordrobe/Accessoires/AccsGrid/RemoveAccessory.is_pressed():
		change_accessoires(null)
		
	if $Clothes/Wordrobe/Shirts/ShirtsGrid/RemoveShirt.is_pressed():
		change_tops(null)
		
	if $Clothes/Wordrobe/Pants/PantsGrid/RemovePants.is_pressed():
		change_bottoms(null)