extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
# Stars :--------------------
	var istruction_screen := get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()
	for star in $"stars-instructions".get_children():
		#position 
		var random_x=rng.randi_range(0, int(istruction_screen.x))
		var random_y=rng.randi_range(0, int(istruction_screen.y))
		star.position = Vector2(random_x,random_y)
		
		# animation speed
		star.speed_scale =rng.randf_range(0.6,1.4)
#------------------------------------------

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _on_backbtn_pressed() -> void:
	get_tree().change_scene_to_file("res://scense/home.tscn")


func _on_backbtn_mouse_entered() -> void:
	$hover.play()
