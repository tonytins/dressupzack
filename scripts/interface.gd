# This project is licensed under the Artistic-2.0 license.
# See the LICENSE file in the project root for more information.
extends Control

export var version: String = "1.0.0"

onready var character = preload("res://resources/character.tres")
onready var blank_accessory = preload("res://sprites/clothes/blank_top.png")
onready var base_top = preload("res://sprites/character/character_base_top.svg")
onready var base_bottom = preload("res://sprites/character/character_base_legs.svg")

onready var export_btn = $CenterBtns/ButtonCtr/ExportBtn
onready var import_btn = $CenterBtns/ButtonCtr/ImportBtn
onready var news_win = $NewsWin
onready var news_btn = $CenterBtns/ButtonCtr/NewsBtn
onready var http_request = $NewsWin/NewsBtns/HTTPRequest

func _ready():
	var verLabel = $VersionLbl
	verLabel.text = "v" + version
	GameData.version = version
	
	var err = http_request.request(GameData.NEWS_API)
	
	if err != OK:
		news_btn.disabled = true
	
	if OS.get_name() == "HTML5":
		export_btn.disabled = true
		import_btn.disabled = true

func _on_NewsBtn_pressed():
	news_win.show()
