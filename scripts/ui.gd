tool
extends Control

onready var character = preload("res://resources/character.tres")
onready var blank_top = preload("res://sprites/clothes/blank_top.png")
onready var blank_bottom = preload("res://sprites/clothes/blank_bottom.png")

func _on_clearBtn_pressed():
	$clear.play()
	character.accessory = blank_top
	character.bottom = blank_bottom
	character.top = blank_top
