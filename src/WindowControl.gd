extends Control

export var toolbar_title = "New Window"
export var content_text = ""
export var panel_height = 216

var drag_pos = null

func _ready():
	$WindowFrame/TitleBarFrame/TitleBar/TitleLbl.text = toolbar_title
	$WindowFrame/ContentFrame/ContentTxt.text = content_text
	$WindowFrame/ContentFrame/ContentPanel.rect_size = Vector2(350, panel_height)
	$WindowFrame.rect_size = Vector2(351, 31 + panel_height)
	update()
	
func _process(delta):
	pass

func _on_TitleBar_gui_input(ev):
	if ev is InputEventMouseButton:
		if ev.button_index == BUTTON_LEFT:
			if ev.pressed:
				drag_pos = get_global_mouse_position() - rect_position
			else:
				drag_pos = null
		
			
	if ev is InputEventMouseMotion and drag_pos != null:
		rect_position = get_global_mouse_position() - drag_pos

func _on_CloseBtn_pressed():
	hide()
	queue_free()
