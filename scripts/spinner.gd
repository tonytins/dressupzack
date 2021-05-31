# This project is licensed under the Artistic-2.0 license.
# See the LICENSE file in the project root for more information.
extends TextureRect

onready var timer = $Timer

func _ready():
	GameEvents.connect("indicate", self, "_on_indicate")
	
func _on_indicate():
	show()
	timer.start()

func _on_Timer_timeout():
	hide()
