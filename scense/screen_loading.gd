extends Control

func _ready() -> void:
	
	# Stars :----------------------------------- 
	var screenloading := get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()
	for star in $stars.get_children():
		#position 
		var random_x=rng.randi_range(0, int(screenloading.x))
		var random_y=rng.randi_range(0, int(screenloading.y))
		star.position = Vector2(random_x,random_y)
		
		# animation speed
		star.speed_scale =rng.randf_range(0.6,1.4)
#--------------------------------------------	
