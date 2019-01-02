extends Node

onready var shell = $Shell
onready var cmdl = $Shell/RefRect/CmdLine
onready var cmdl_help = $Shell/HelpWin

const CLOSE_CMD = "close"

func _process(delta):
	cmd_interface()

func cmd_interface():
	var settingsBtn = $Interface/RefRect/VertContainer/SettingsBtn
	
	if Input.is_action_pressed("ui_shell"):
		if cmdl.text == CLOSE_CMD:
			cmdl.text = ""
		shell.show()
	
	if cmdl.text == "lang sv" and Input.is_key_pressed(KEY_ENTER):
		TranslationServer.set_locale("sv")
	elif cmdl.text == "lang en" and Input.is_key_pressed(KEY_ENTER):
		TranslationServer.set_locale("en")
	elif cmdl.text == "help"and Input.is_key_pressed(KEY_ENTER):
		cmdl_help.show()
	elif cmdl.text == "show settings" and  Input.is_key_pressed(KEY_ENTER):
		settingsBtn.show()
	elif cmdl.text == "hide settings" and  Input.is_key_pressed(KEY_ENTER):
		settingsBtn.hide()
	elif cmdl.text == CLOSE_CMD and Input.is_key_pressed(KEY_ENTER):
		shell.hide()
