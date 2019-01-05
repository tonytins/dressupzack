# Anthony Wilcox licenses this file to you under the GPL license.
# See the LICENSE file in the project root for more information.
extends Control

func pause_zdressup(is_paused):
	if is_paused == true:
		get_tree().paused = true
	else:
		get_tree().paused = false

func _on_ExitBtn_pressed():
	pause_zdressup(false)
	get_tree().change_scene("res://StartScn.tscn")
		
func _on_SettingsBtn_pressed():
	$SettingsWin.show()

func _on_CreditsBtn_pressed():
	$CreditsWin.show()

func _on_LicenseBtn_pressed():
	$LicenseWin.show()

func _on_CloseAbtBtn_pressed():
	$AboutWin.hide()
	
func _on_MusicBtn_toggled(button_pressed):
	if button_pressed == true:
		$Music.playing = true
	else:
		$Music.playing = false

func _on_ResumeBtn_pressed():
	$PauseWin.hide()
	pause_zdressup(false)