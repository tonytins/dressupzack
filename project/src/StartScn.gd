# Anthony Wilcox licenses this file to you under the GPL license.
# See the LICENSE file in the project root for more information.
extends Node

func _on_ClassicBtn_pressed():
	get_tree().change_scene("res://ClassicScn.tscn")

func _on_ModernBtn_pressed():
	get_tree().change_scene("res://ModernScn.tscn")

func _on_ClassicBtn_mouse_entered():
	$Modern.hide()
	$ClassicBG.show()

func _on_ClassicBtn_mouse_exited():
	$ClassicBG.hide()
	$Modern.show()

func _on_CreditsBtn_pressed():
	$WinDialogs/CreditsWin.show()

func _on_LicenseBtn_pressed():
	$WinDialogs/LicenseWin.show()

func _on_PlayBtn_toggled(button_pressed):
	if button_pressed == true:
		$MenuRf/ModePanel.show()
	else:
		$MenuRf/ModePanel.hide()
