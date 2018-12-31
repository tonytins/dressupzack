# Anthony Wilcox licenses this file to you under the GPL license.
# See the LICENSE file in the project root for more information.
extends Node

func _on_Timer_timeout():
	get_tree().change_scene("res://MainScreen.tscn")
