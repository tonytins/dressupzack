# Anthony Wilcox licenses this file to you under the GPL license.
# See the LICENSE file in the project root for more information.
extends Node

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
		$Body/Bottom.texture = bottoms
		
	if undies == load("res://sprites/owo_censor.svg"):
		change_undies(null)
		
	$Body/Bottom.texture = bottoms
	
func change_undies(new_undies):
	undies = new_undies
	$Body/Undies.texture = undies

func change_tops(new_top):
	tops = new_top
	
	if new_top == null:
		$Body/Top.texture = tops
	
	$Body/Top.texture = tops
	
func change_accessoires(new_accessory):
	accessory = new_accessory
	
	if new_accessory == null:
		$Body/Top.texture = accessory
	
	$Body/Accessory.texture = accessory

func _on_Remove_Shirt_pressed():
	change_tops(null)

func _on_Remove_Pants_pressed():
	change_bottoms(null)

func _on_Remove_Accessory_pressed():
	change_accessoires(null)

func _on_DJ_Shorts_pressed():
	change_bottoms(load("res://sprites/dj_shorts.png"))

func _on_ZBriefs_pressed():
	change_undies(load("res://sprites/z_briefs.png"))

func _on_Briefs_pressed():
	change_undies(load("res://sprites/briefs.svg"))

func _on_Jeans_pressed():
	change_bottoms(load("res://sprites/jeans.svg"))
	
func _on_OwO_Censor_pressed():
	change_bottoms(null)
	change_undies(load("res://sprites/owo_censor.svg"))

func _on_Sweats_pressed():
	change_bottoms(load("res://sprites/sweat_pants.svg"))

func _on_Sweatshirt_pressed():
	change_tops(load("res://sprites/old_sweatshirt.png"))

func _on_DJ_Shirt_pressed():
	change_tops(load("res://sprites/dj_shirt.png"))

func _on_Raw_pressed():
	change_tops(load("res://sprites/raw_shirt.svg"))

func _on_Atomic_pressed():
	change_tops(load("res://sprites/atomic_shirt.svg"))
	
func _on_Korm_Shirt_pressed():
	change_tops(load("res://sprites/korm_shirt.png"))

func _on_Z_Shirt_pressed():
	change_tops(load("res://sprites/z_shirt.png"))

func _on_Biker_Jacket_pressed():
	change_tops(load("res://sprites/biker_jacket.png"))
	
func _on_Train_Hoodie_pressed():
	change_tops(load("res://sprites/train_hoodie.png"))

func _on_Beat_Up_Jeans_pressed():
	change_bottoms(load("res://sprites/beat_up_jeans.svg"))

func _on_NL_Jacket_pressed():
	change_tops(load("res://sprites/nl_jacket.png"))
	
func _on_Blue_Camo_Jeans_pressed():
	change_bottoms(load("res://sprites/blue_camo_jeans.svg"))

func _on_Whats_New_Shirt_pressed():
	change_tops(load("res://sprites/whatsnew_shirt.png"))

func _on_Fundosi_pressed():
	change_undies(load("res://sprites/fundosi.svg"))

func _on_Camera_pressed():
	change_accessoires(load("res://sprites/camera.png"))
