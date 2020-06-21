# Anthony Wilcox licenses this file to you under the MPL license.
# See the LICENSE file in the project root for more information.
extends Node

func _process(delta):
	if Input.is_action_just_pressed("ui_pause"):
			$PauseWin.show()
			GameKit.is_game_paused(true)

func _on_ExitBtn_pressed():
	GameKit.is_game_paused(false)
	GameKit.switch_scenes("title")
		
func _on_SettingsBtn_pressed():
	$SettingsWin.show()

func _on_CreditsBtn_pressed():
	GameKit.switch_scenes("credits")

func _on_LicenseBtn_pressed():
	$LicenseWin.show()

func _on_CloseAbtBtn_pressed():
	$AboutWin.hide()
	
func _on_MusicBtn_toggled(button_pressed):
	if button_pressed == true:
		UserSettings.IsMusicPaused = true
	else:
		UserSettings.IsMusicPaused = false

func _on_ResumeBtn_pressed():
	$PauseWin.hide()
	GameKit.is_game_paused(false)
