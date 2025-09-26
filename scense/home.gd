extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_playgame_pressed() -> void:
	$click.play()
	get_tree().change_scene_to_file("res://scense/level.tscn")
	


func _on_instructions_pressed() -> void:
	$click.play()
	get_tree().change_scene_to_file("res://scense/instructions.tscn")
	
	
func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_playgame_mouse_entered() -> void:
	$hover.play()


func _on_instructions_mouse_entered() -> void:
	$hover.play()


func _on_exit_mouse_entered() -> void:
	$hover.play()


func _on_playgame_focus_entered() -> void:
	$hover.play()

func _on_instructions_focus_entered() -> void:
	$hover.play()


func _on_exit_focus_entered() -> void:
	$hover.play()
	
