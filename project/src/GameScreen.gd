extends Node2D

onready var shell = $Shell
onready var cmdl = $Shell/RefRect/HSplit/CmdLine
onready var cmdl_exit_btn = $Shell/RefRect/HSplit/ExitBtn

func _process(delta):
	cmd_interface()
	
func cmd_interface():
	if Input.is_action_pressed("ui_test"):
		shell.show()
	
	if cmdl_exit_btn.pressed:
		shell.hide()	
	
	if cmdl.text == "lang sv" and Input.is_key_pressed(KEY_ENTER):
		TranslationServer.set_locale("sv")
	elif cmdl.text == "lang en" and Input.is_key_pressed(KEY_ENTER):
		TranslationServer.set_locale("en")
