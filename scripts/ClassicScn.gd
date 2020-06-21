# Anthony Wilcox licenses this file to you under the MPL license.
# See the LICENSE file in the project root for more information.
extends Node

func _process(delta):
	if Input.is_action_pressed("ui_pause"):
		GameKit.is_game_paused(true)
		$WinDialogs/PauseWin.show()