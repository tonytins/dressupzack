extends Node

const CLOSE_CMD = "close"

func _process(delta):
	shell_interface()

func shell_interface():
	var shell = $Shell
	var cmdl = $Shell/RefRect/CmdLine
	var cmdl_help = $Shell/HelpWin
	var settingsWin = $Interface/SettingsWin
	
	if Input.is_action_pressed("ui_shell"):
		if cmdl.text == CLOSE_CMD:
			cmdl.text = ""
		shell.show()
	
	if cmdl.text == "help"and Input.is_key_pressed(KEY_ENTER):
		cmdl_help.show()
	elif cmdl.text == "settings" and  Input.is_key_pressed(KEY_ENTER):
		settingsWin.show()
	elif cmdl.text == CLOSE_CMD and Input.is_key_pressed(KEY_ENTER):
		shell.hide()
