extends CanvasLayer

@onready var player: CharacterBody2D = $".."

func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_resume_pressed() -> void:
	player.pausemenue()
