extends Node


@onready var tops = $Tops
@onready var bottoms = $Bottoms

func _on_tops_fwd_btn_pressed():
	var current_frame = tops.get_frame()
	tops.frame = current_frame + 1;

func _on_tops_bck_btn_pressed():
	var current_frame = tops.get_frame()
	tops.frame = current_frame + -1;


func _on_bottoms_bck_btn_pressed():
	var current_frame = bottoms.get_frame()
	bottoms.frame = current_frame + -1;


func _on_bottoms_fwd_btn_pressed():
	var current_frame = bottoms.get_frame()
	bottoms.frame = current_frame + 1;
