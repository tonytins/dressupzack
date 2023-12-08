# This project is licensed under the GPL-3.0 license.
# See the LICENSE file in the project root for more information.
extends Control

func _ready():
	var version = ProjectSettings.get_setting("application/config/version")
	var verLabel = $VersionLbl
	verLabel.text = "v" + version
