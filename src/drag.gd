extends TextureButton

var item_pos = null

func _on_outfit_gui_input(ev):
	if ev is InputEventMouseButton:
		if ev.button_index == BUTTON_LEFT:
			if ev.pressed:
				item_pos = get_global_mouse_position() - rect_position
			else:
				item_pos = null
				
	if ev is InputEventMouseMotion and item_pos != null:
		rect_position = get_global_mouse_position() - item_pos
