# Anthony Wilcox licenses this file to you under the GPL license.
# See the LICENSE file in the project root for more information.
extends Control
 
onready var about_win = $AboutWin
onready var credits_win = $CreditsWin

func _on_AboutBtn_pressed():
	about_win.show()
	
func _on_CreditsBtn_pressed():
	credits_win.show()

func _on_MusicBtn_toggled(button_pressed):
	if button_pressed == true:
		$Music.play()
	else:
		$Music.stop()
