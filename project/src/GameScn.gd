# Anthony Wilcox licenses this file to you under the GPL license.
# See the LICENSE file in the project root for more information.
extends Node

func _process(delta):
	if Input.is_action_pressed("ui_pause"):
		get_tree().paused = true
		$WinDialogs/PauseWin.show()
