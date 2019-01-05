# Anthony Wilcox licenses this file to you under the GPL license.
# See the LICENSE file in the project root for more information.
extends Control
 
func _on_AboutBtn_pressed():
	$WinDialogs/AboutWin.show()
	
func _on_SettingsBtn_pressed():
	$WinDialogs/SettingsWin.show()

func _on_MusicBtn_toggled(button_pressed):
	if button_pressed == true:
		$Music.playing = true
	else:
		$Music.playing = false

func _on_ClassicBtn_pressed():
	if $Music.playing == true:
		$Music.playing = false
		
	get_tree().change_scene("res://ClassicScreen.tscn")


func _on_ModernBtn_pressed():
	if $Music.playing == true:
		$Music.playing = false
		
	get_tree().change_scene("res://GameScreen.tscn")
