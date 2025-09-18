extends CanvasLayer

var heart_texture = load("res://Graphic/heart-icon-valentine-2 1.png")

func set_health(amount):
		var hbox =$MarginContainer/HBoxContainer
		# delte
		for child in hbox.get_children():
			child.queue_free()
		
		for i in amount:
			var	heart =TextureRect.new()
			heart.texture=heart_texture
			heart.rect_min_size=Vector2(25,25)
			heart.rect_size=Vector2(25,25)
			heart.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_CENTERED
			hbox.add_child(heart)
			
