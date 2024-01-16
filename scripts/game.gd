extends Node


@onready var tops = $Seperate/Tops
@onready var bottoms = $Seperate/Bottoms
@onready var seperate_items = $Seperate
@onready var bottoms_bck = $Canvas/UI/DressUpCtrls/BottomsBckBtn
@onready var bottoms_fwd = $Canvas/UI/DressUpCtrls/BottomsFwdBtn
@onready var full_body = $FullBody

var is_seperate = true
var is_full_body = false

var config_file = Config.config_file()
var save_file = Config.save_file()

func _ready():
		
	if !FileAccess.file_exists(config_file):
		Config.save_config(config_file)
		
	if !FileAccess.file_exists(save_file):
		Config.save_game(save_file)
		
	if FileAccess.file_exists(save_file):
		var clothes_section = "clothes"
		tops.frame = Config.load_config(clothes_section, "tops", save_file)
		bottoms.frame = Config.load_config(clothes_section, "bottoms", save_file)
		full_body.frame = Config.load_config(clothes_section, "full_body", save_file)
	
	if FileAccess.file_exists(config_file):
		var window_section = "window"
		var window_height = Config.load_config(window_section, "height", config_file)
		var window_width = Config.load_config(window_section, "width", config_file)
		
		if window_height && window_width != null:
			DisplayServer.window_set_size(Vector2i(window_height, window_width))
func game_save():
	Config.save_game(tops.frame, bottoms.frame, full_body.frame, save_file, true)
	
func _process(delta):
	if Input.is_action_just_pressed("exit"):
		game_save()
		get_tree().quit()
		
func _on_save_btn_pressed():
	game_save()

func _on_tops_fwd_btn_pressed():
	var current_frame
	
	if is_seperate:
		current_frame = tops.frame
		tops.frame = current_frame + 1;
	
	if is_full_body:
		current_frame = full_body.frame
		full_body.frame = current_frame + 1;

func _on_tops_bck_btn_pressed():
	var current_frame
	if is_seperate:
		current_frame = tops.frame
		tops.frame = current_frame + -1;
	
	if is_full_body:
		current_frame = full_body.frame
		full_body.frame = current_frame + -1;

func _on_bottoms_bck_btn_pressed():
	var current_frame = bottoms.frame
	bottoms.frame = current_frame + -1;


func _on_bottoms_fwd_btn_pressed():
	var current_frame = bottoms.frame
	bottoms.frame = current_frame + 1;

func _on_fullbody_btn_pressed():
	is_seperate = false
	is_full_body = true
	seperate_items.hide()
	bottoms_bck.hide()
	bottoms_fwd.hide()
	full_body.show()

func _on_separate_btn_pressed():
	is_seperate = true
	is_full_body = false
	seperate_items.show()
	bottoms_bck.show()
	bottoms_fwd.show()
	full_body.hide()


