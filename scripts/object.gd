# This project is licensed under the GPL-3.0 license.
# See the LICENSE file in the project root for more information.
@tool
extends Node2D

@export var group: String = "dropable"
@export var texture: Texture2D

var is_draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2

@onready var sprite = $Sprite2D
@onready var collsion = $Area2D/CollisionShape2D

func _ready():
	sprite.texture = texture
	collsion.position = sprite.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_draggable:
		if Input.is_action_just_pressed("click"):		
			offset = global_position - get_global_mouse_position()
			Global.is_dragging = true
			
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			Global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropable:
				tween.tween_property(self, "position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "global_position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
				
			
func _on_area_2d_body_entered(body):
	if body.is_in_group(group):
		is_inside_dropable = true
		body.modulate = Color(Color.REBECCA_PURPLE, 1)
		scale = Vector2(1.05, 1.05)
		body_ref = body

func _on_area_2d_body_exited(body:StaticBody2D):
	if body.is_in_group(group):
		is_inside_dropable = false
		body.modulate = Color(Color.MEDIUM_PURPLE, .7)
		scale = Vector2(1.05, 1.05)


func _on_area_2d_mouse_entered():
	if not Global.is_dragging:
		is_draggable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited():
	if not Global.is_dragging:
		is_draggable = false
		scale = Vector2(1, 1)
