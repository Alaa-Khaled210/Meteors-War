extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Stars 
	var optionscreen := get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()
	for star in $stars.get_children():
		#position 
		var random_x=rng.randi_range(0, int(optionscreen.x))
		var random_y=rng.randi_range(0, int(optionscreen.y))
		star.position = Vector2(random_x,random_y)
		
		# animation speed
		star.speed_scale =rng.randf_range(0.6,1.4)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


func _on_backbtn_mouse_entered() -> void:
	$hover.play()
	
func _on_backbtn_pressed() -> void:
	$click.play()
	await get_tree().create_timer(0.25).timeout
	get_tree().change_scene_to_file("res://scense/home.tscn")
