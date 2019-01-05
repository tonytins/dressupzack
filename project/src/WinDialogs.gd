# Anthony Wilcox licenses this file to you under the GPL license.
# See the LICENSE file in the project root for more information.
extends Control

func _on_CreditsBtn_pressed():
	$CreditsWin.show()

func _on_LicenseBtn_pressed():
	$SettingsWin.show()

func _on_CloseAbtBtn_pressed():
	$AboutWin.hide()