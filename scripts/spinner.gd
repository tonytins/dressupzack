extends TextureRect

onready var timer = $Timer

func _ready():
	GameEvents.connect("indicate", self, "_on_indicate")
	
func _on_indicate():
	show()
	timer.start()

func _on_Timer_timeout():
	hide()
