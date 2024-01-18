extends Node

@onready var tops = $Seperate/Tops
@onready var bottoms = $Seperate/Bottoms
@onready var seperate_items = $Seperate
@onready var bottoms_bck = $Canvas/UI/DressUpCtrls/BottomsBckBtn
@onready var bottoms_fwd = $Canvas/UI/DressUpCtrls/BottomsFwdBtn
@onready var outfits = $Outfits
@onready var forward_click = $ForwardClick
@onready var back_click = $BackClick

# Only here for debugging purposes
@onready var outfits_btn = $Canvas/UI/SettingsCtrls/FullbodyBtn

var is_seperate: bool = true
var is_outfits: bool = false
var current_frame: int
var sprite_frames: SpriteFrames

var config_file = Config.config_file()
var save_file = Config.save_file()

func _ready():
	
	# Keep outfits button enabled in debug builds
	if OS.is_debug_build():
		outfits_btn.disabled = false
	
	# If config files don't exist, create them
	if !FileAccess.file_exists(config_file):
		Config.save_config(config_file)
		
	if !FileAccess.file_exists(save_file):
		Config.save_game(save_file)
	
	# Load last saved game	
	if FileAccess.file_exists(save_file):
		var clothes_section = "clothes"
		tops.frame = Config.load_config(clothes_section, "tops", save_file)
		bottoms.frame = Config.load_config(clothes_section, "bottoms", save_file)
		outfits.frame = Config.load_config(clothes_section, "outfits", save_file)
	
	# Load window size
	if FileAccess.file_exists(config_file):
		var window_section = "window"
		var window_height = Config.load_config(window_section, "height", config_file)
		var window_width = Config.load_config(window_section, "width", config_file)
		var viewport = get_viewport();
		
		# Set window size
		DisplayServer.window_set_size(Vector2i(window_width, window_height))

func save_all():
	Config.save_game(tops.frame, bottoms.frame, outfits.frame, save_file, true)

func next_frame(animation: AnimatedSprite2D, sprite_frames: SpriteFrames, animation_name, rewind = false):
	var max_frames = sprite_frames.get_frame_count(animation_name) - 1
	current_frame = animation.frame
	
	if !rewind:
		forward_click.play()
		animation.frame = current_frame + 1
		if current_frame == max_frames:
			animation.frame = 0
	else:
		back_click.play()
		animation.frame = current_frame + -1
		if current_frame == 0:
			animation.frame = max_frames
		
func _process(delta):
	if Input.is_action_just_pressed("exit"):
		save_all()
		get_tree().quit()
		
func _on_save_btn_pressed():
	save_all()

func _on_tops_fwd_btn_pressed():
	next_frame(tops, tops.sprite_frames, "tops")
	
	if is_outfits:
		next_frame(outfits, outfits.sprite_frames, "fullbody")

func _on_tops_bck_btn_pressed():
	next_frame(tops, tops.sprite_frames, "tops", true)
	
	if is_outfits:
		next_frame(outfits, outfits.sprite_frames, "fullbody", true)

func _on_bottoms_bck_btn_pressed():
	next_frame(bottoms, bottoms.sprite_frames, "bottoms", true)


func _on_bottoms_fwd_btn_pressed():
	next_frame(bottoms, bottoms.sprite_frames, "bottoms")

func _on_fullbody_btn_pressed():
	is_seperate = false
	is_outfits = true
	seperate_items.hide()
	bottoms_bck.hide()
	bottoms_fwd.hide()
	outfits.show()

func _on_separate_btn_pressed():
	is_seperate = true
	is_outfits = false
	seperate_items.show()
	bottoms_bck.show()
	bottoms_fwd.show()
	outfits.hide()


