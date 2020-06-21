# Anthony Wilcox licenses this file to you under the MPL license.
# See the LICENSE file in the project root for more information.
extends Control

func _ready():
	$Version.text = GameKit.version

func _on_ClassicBtn_pressed():
	GameKit.switch_scenes("classic")

func _on_ModernBtn_pressed():
	GameKit.switch_scenes("play")

func _on_CreditsBtn_pressed():
	GameKit.switch_scenes("credits")

func _on_LicenseBtn_pressed():
	$WinDialogs/LicenseWin.show()

func _on_PlayBtn_pressed():
	GameKit.switch_scenes("play")
