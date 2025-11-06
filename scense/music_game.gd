extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
var home_music = preload("res://Audio/wind-chimes-with-wind-and-light-rain-171624.mp3")
func _ready() -> void:
	if not $".".is_playing(): # Only play if not already playing
		play_home_music()

func play_home_music():
	$".".stream=home_music
	if not MusicGame.get_node("/root/MusicGame").is_playing(): # Only play if not already playing
		MusicGame.get_node("/root/MusicGame").play()

func stop_music():
	$".".stop()
