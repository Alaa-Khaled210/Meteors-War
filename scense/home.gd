extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Stars 
	var homescreen := get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()
	for star in $stars.get_children():
		#position 
		var random_x=rng.randi_range(0, int(homescreen.x))
		var random_y=rng.randi_range(0, int(homescreen.y))
		star.position = Vector2(random_x,random_y)
		
		# animation speed
		star.speed_scale =rng.randf_range(0.6,1.4)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _on_playgame_pressed() -> void:
	$click.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scense/level.tscn")
	


func _on_instructions_pressed() -> void:
	$click.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scense/instructions.tscn")
	
	
func _on_exit_pressed() -> void:
	$click.play()
	await get_tree().create_timer(0.25).timeout
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
	
