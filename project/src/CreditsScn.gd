# Anthony Wilcox licenses this file to you under the MPL license.
# See the LICENSE file in the project root for more information.
extends Node

func _ready():
 $Version.text = GameKit.version

func _process(delta):
	$Character/Undies.texture = UserSettings.Underwear
	$Character/Bottom.texture = UserSettings.Bottoms
	$Character/Top.texture = UserSettings.Tops
	$Character/Accessory.texture = UserSettings.Accessory
	