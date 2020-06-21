# Anthony Wilcox licenses this file to you under the MPL license.
# See the LICENSE file in the project root for more information.
extends AudioStreamPlayer

var playlist = []
var tracks = detect_music()

func _ready():
	play_random_song()
	connect("finished", self, "play_random_song")

	
func detect_music():
	var files = []
	var dir = Directory.new()
	var music_dir = "res://music/";
	dir.open(music_dir)
	dir.list_dir_begin()
	
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with(".") and file.get_extension() == "ogg":
			files.append(music_dir + file)
			
	dir.list_dir_end()
		
	return files

func play_random_song():

	if tracks.size() > 0:
		playlist = tracks
		var rand_song = randi() % playlist.size()
		print_debug(playlist)
#		var audiostream = load(playlist[rand_song])
#		stream = audiostream
#		play()
		print_debug(playlist[rand_song])
	else:
		print_debug("Music not found")
