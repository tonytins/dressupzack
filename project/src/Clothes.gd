extends Node

onready var bottoms = load("res://assets/bottoms_placeholder.png")
onready var tops = load("res://assets/tops_placeholder.png")

func change_bottoms(new_bottom):
	bottoms = new_bottom
	$Body/Bottom.texture = bottoms

func change_tops(new_top):
	tops = new_top
	$Body/Top.texture = tops

func _on_DJ_Shorts_pressed():
	change_bottoms(load("res://assets/dj_shorts.png"))

func _on_ZBriefs_pressed():
	change_bottoms(load("res://assets/zbriefs.png"))

func _on_Briefs_pressed():
	change_bottoms(load("res://assets/briefs.png"))

func _on_Jeans_pressed():
	change_bottoms(load("res://assets/jeans.png"))

func _on_Sweats_pressed():
	change_bottoms(load("res://assets/sweat_pants.png"))

func _on_Sweatshirt_pressed():
	change_tops(load("res://assets/old_sweatshirt.png"))

func _on_DJ_Shirt_pressed():
	change_tops(load("res://asssets/dj_shirt.png"))

func _on_Raw_pressed():
	change_tops(load("res://assets/raw_shirt.png"))

func _on_Atomic_pressed():
	change_tops(load("res://assets/atomic_shirt.png"))
