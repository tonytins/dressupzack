# This project is licensed under the GPL-3.0 license.
# See the LICENSE file in the project root for more information.
extends StaticBody2D

func _ready():
	modulate = Color(Color.MEDIUM_PURPLE, 0.7)
	
func _process(delta):
	if Global.is_dragging:
		visible = true
	else:
		visible = false
