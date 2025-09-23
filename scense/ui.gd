extends CanvasLayer

static var image = load("res://Graphic/rocket2.png")
var time_elapsed := 0
func set_health(amount):
	
# remove all children from hboxcontainer
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
		$DamagePlayer.play()

# creat new childrean amount is set by health 
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture=image
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		#text_rect.stretch_mode=TextureRect.STRETCH_KEEP
		#text_rect.rect_min_size=Vector2(25,25)
		#text_rect.rect_size=Vector2(25,25)
		text_rect.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	
		#------------------------------------------------------

func _on_score_timer_timeout() -> void:
	time_elapsed += 1
	$MarginContainer/Label.text=str(time_elapsed)
	Global.score=time_elapsed
