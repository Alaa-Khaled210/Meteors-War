extends CanvasLayer

@onready var player: CharacterBody2D = $".."

func _on_resume_focus_entered() -> void:
	$hover.play()

	
func _on_exit_focus_entered() -> void:
	$hover.play()
	

func _on_resume_mouse_entered() -> void:
	$hover.play()
	

func _on_exit_mouse_entered() -> void:
	$hover.play()
	
func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_resume_pressed() -> void:
	$click.play()
	player.pausemenue()
