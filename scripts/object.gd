# This project is licensed under the GPL-3.0 license.
# See the LICENSE file in the project root for more information.
extends Node2D

var is_draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_draggable:
		if Input.is_action_just_pressed("click"):		
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
		elif Input.is_action_just_released("click"):
			Global.is_dragging = false
			
func _on_area_2d_body_entered(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_body_exited(body:StaticBody2D):
	if body.is_in_group('dropable'):
		is_inside_dropable = false
		scale = Vector2(1.05, 1.05)


func _on_area_2d_mouse_entered():
	if not Global.is_dragging:
		is_draggable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited():
	if not Global.is_dragging:
		is_draggable = false
		scale = Vector2(1, 1)
