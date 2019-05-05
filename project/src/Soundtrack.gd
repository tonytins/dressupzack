extends AudioStreamPlayer

const tracks = [
	'reminiscing',
	'together_again',
	'at_the_lake',
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