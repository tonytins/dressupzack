# Anthony Wilcox licenses this file to you under the GPL license.
# See the LICENSE file in the project root for more information.
extends AudioStreamPlayer

const tracks = [
	'reminiscing',
	'together_again',
	'at_the_lake',
	'mushrooms',
]

func _ready():
	connect("finished", self, "play_random_song")
	play_random_song()

func play_random_song():
	randomize()

	var rand_db = randi() % tracks.size()
	var audiostream = load('res://music/' + tracks[rand_db] + '.ogg')
	stream = audiostream
	play()