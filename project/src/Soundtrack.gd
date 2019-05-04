extends AudioStreamPlayer

const tracks = [
	'reminiscing',
	'together_again',
	'at_the_lake',
]
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("finished", self, "play_random_song")
	play_random_song()

func play_random_song():
	randomize()
	
	var rand_db = randi() % tracks.size()
	var audiostream = load('res://music/' + tracks[rand_db] + '.ogg')
	set_stream(audiostream)
	play()
	
	
	