extends Control

const DEFUALT_CONTENT_HEIGHT = 216
const DEFUALT_PANEL_SIZE = Vector2(351, 216)

export var toolbar_title = ""
export var content_text = ""
export var content_height = DEFUALT_CONTENT_HEIGHT

var drag_pos = null

func _ready():
	if toolbar_title and content_text != "":
		$WindowFrame/TitleBarFrame/TitleBar/TitleLbl.text = toolbar_title
		$WindowFrame/ContentFrame/ContentTxt.bbcode_text = content_text
	
	if $WindowFrame/ContentFrame/ContentPanel.rect_size <= DEFUALT_PANEL_SIZE:
		$WindowFrame/ContentFrame/ContentPanel.rect_size = Vector2(351, content_height)
		$WindowFrame.rect_size = Vector2(351, 33 + content_height)
	else:
		$WindowFrame/ContentFrame/ContentPanel.rect_size = DEFUALT_PANEL_SIZE
		
	update()


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
