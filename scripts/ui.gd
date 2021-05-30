# This project is licensed under the MPL license.
# See the LICENSE file in the project root for more information.
extends Control

export var version: String = "1.0.0"

onready var character = preload("res://resources/character.tres")
onready var blank_accessory = preload("res://sprites/clothes/blank_top.png")
onready var base_top = preload("res://sprites/character/character_base_top.svg")
onready var base_bottom = preload("res://sprites/character/character_base_legs.svg")

func _ready():
	var verLabel = $versionLbl
	verLabel.text = "v" + version
	GameData.version = version
