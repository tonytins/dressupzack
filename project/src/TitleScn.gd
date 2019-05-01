# Anthony Wilcox licenses this file to you under the GPL license.
# See the LICENSE file in the project root for more information.
extends "res://src/GameKit.gd"

func _on_ClassicBtn_pressed():
	switch_scenes("classic")

func _on_ModernBtn_pressed():
	switch_scenes("modern")

func _on_CreditsBtn_pressed():
	$WinDialogs/CreditsWin.show()

func _on_LicenseBtn_pressed():
	$WinDialogs/LicenseWin.show()

func _on_PlayBtn_pressed():
	$MenuRf/ModePanel.show()
