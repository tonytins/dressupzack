extends Control

export var version: String = "1.0.0"

onready var character = preload("res://resources/character.tres")
onready var blank_accessory = preload("res://sprites/clothes/blank_top.png")
onready var base_top = preload("res://sprites/character_base_top.svg")
onready var base_bottom = preload("res://sprites/character_base_legs.svg")

func _ready():
	var verLabel = $versionLbl
	verLabel.text = "v" + version

func _on_clearBtn_pressed():
	$clear.play()
	character.accessory = blank_accessory
	character.bottom = base_bottom
	character.top = base_top
