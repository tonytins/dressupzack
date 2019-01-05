# Anthony Wilcox licenses this file to you under the GPL license.
# See the LICENSE file in the project root for more information.
extends Control
 
func _on_AboutBtn_pressed():
	$WinDialogs/AboutWin.show()
	
func _on_SettingsBtn_pressed():
	$WinDialogs/SettingsWin.show()

func _on_ClassicBtn_pressed():
	get_tree().change_scene("res://ClassicScreen.tscn")

func _on_ModernBtn_pressed():
	get_tree().change_scene("res://GameScreen.tscn")
