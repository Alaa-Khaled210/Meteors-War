extends Node

const SAVEFILE = "user://savefile.save"
var score := 0
var best_score:= 0

func _ready() -> void:
	load_score()
	
func save_score():
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE)
	file.store_var(best_score)

func load_score():
	if FileAccess.file_exists(SAVEFILE):
		var file = FileAccess.open(SAVEFILE, FileAccess.READ)
		best_score = file.get_var()
		file.close()
