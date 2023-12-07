# This project is licensed under the Artistic-2.0 license.
# See the LICENSE file in the project root for more information.
extends TextureRect

var is_draggable = false
var is_inside_draggable = false
var body_ref

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_draggable:
		if Input.is_action_just_pressed("click"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			is_draggable = false
			var tween = get_tree().create_tween()
			if is_inside_draggable:
				tween.tween_property(self,"postion",body_ref.position,0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self,"global_postion",body_ref.position,0.2).set_ease(Tween.EASE_OUT)

func _get_drag_data(at_position):
	var preview_texture = TextureRect.new()
	
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(106, 112)
	
	set_drag_preview(preview_texture)
	
	return preview_texture.texture
	
func _can_drop_data(at_position, data):
	return data is Texture2D
	
func _drop_data(at_position, data):
	texture = data
