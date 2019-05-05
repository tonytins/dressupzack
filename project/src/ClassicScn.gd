# Anthony Wilcox licenses this file to you under the GPL license.
# See the LICENSE file in the project root for more information.
extends "res://src/GameKit.gd"

func _process(delta):
	if Input.is_action_pressed("ui_pause"):
		is_game_paused(true)
		$WinDialogs/PauseWin.show()