# Anthony Wilcox licenses this file to you under the GPL license.
# See the LICENSE file in the project root for more information.
extends Control
 
func _on_SettingsBtn_pressed():
	$WinDialogs/SettingsWin.show()

func _on_ExitBtn_pressed():
	get_tree().change_scene("res://StartScn.tscn")
