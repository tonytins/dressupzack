# Anthony Wilcox licenses this file to you under the GPL license.
# See the LICENSE file in the project root for more information.
extends Node

onready var bottoms = load("res://assets/bottoms_placeholder.png")
onready var undies = load("res://assets/zbriefs.png")
onready var tops = load("res://assets/tops_placeholder.png")

func change_bottoms(new_bottom):
	bottoms = new_bottom
	
	if new_bottom == null:
		$Body/Bottom.texture = bottoms
		
	if undies == load("res://assets/owo_censor.png"):
		change_undies(null)
		
	$Body/Bottom.texture = bottoms
	
func change_undies(new_undies):
	undies = new_undies
	
	if new_undies == null:
		$Body/Undies.texture = undies

	$Body/Undies.texture = undies

func change_tops(new_top):
	tops = new_top
	
	if new_top == null:
		$Body/Top.texture = tops
	
	$Body/Top.texture = tops

func _on_DJ_Shorts_pressed():
	change_bottoms(load("res://assets/dj_shorts.png"))

func _on_ZBriefs_pressed():
	change_undies(load("res://assets/zbriefs.png"))

func _on_Briefs_pressed():
	change_undies(load("res://assets/briefs.png"))

func _on_Jeans_pressed():
	change_bottoms(load("res://assets/jeans.png"))
	
func _on_OwO_Censor_pressed():
	change_bottoms(null)
	change_undies(load("res://assets/owo_censor.png"))

func _on_Sweats_pressed():
	change_bottoms(load("res://assets/sweat_pants.png"))

func _on_Sweatshirt_pressed():
	change_tops(load("res://assets/old_sweatshirt.png"))

func _on_DJ_Shirt_pressed():
	change_tops(load("res://assets/dj_shirt.png"))

func _on_Raw_pressed():
	change_tops(load("res://assets/raw_shirt.png"))

func _on_Atomic_pressed():
	change_tops(load("res://assets/atomic_shirt.png"))

func _on_Z_Shirt_pressed():
	change_tops(load("res://assets/z_shirt.png"))

func _on_Biker_Jacket_pressed():
	change_tops(load("res://assets/biker_jacket.png"))

func _on_Beat_Up_Jeans_pressed():
	change_bottoms(load("res://assets/beat_up_jeans.png"))

func _on_NL_Jacket_pressed():
	change_tops(load("res://assets/nl_jacket.png"))

func _on_ClearBtn_pressed():
	change_bottoms(null)
	change_undies(null)
	change_tops(null)
