extends Control

@export var level_scene : PackedScene 

# Called every frame. 'delta' is the elapsed time since the previous frame.\


func _ready() -> void:
	#stop back music
	#MusicGame.get_node("/root/MusicGame").stop()
	# quote----------------
	var q2 =$Panel/quates/quote2.text
	var q3 =$Panel/quates/quote3.text
	var q4 =$Panel/quates/quote4.text
	var q5 =$Panel/quates/quote5.text
	var q6 =$Panel/quates/quote6.text
	var q7 =$Panel/quates/quote7.text
	var q8 =$Panel/quates/quote8.text
	var q9 =$Panel/quates/quote9.text
	var strList = [q2,q3,q4,q5,q6,q7,q8,q9]
	var rng = RandomNumberGenerator.new()
	#genreate time-based seed, otherwise the same random sequence of 
	#test will always be shown
	rng.randomize()
	#generate a randon integer to be used as an index
	var ix = rng.randi_range(0,strList.size()-1)	
	var randomStr  = strList[ix]
	$Panel/quote1.text =randomStr
	#-----------------------------------
	
	#to concatenate label title score with value of score
	$CenterContainer/VBoxContainer/Label2.text=$CenterContainer/VBoxContainer/Label2.text +str(Global.score)
	# Score check if the best
	if Global.score > Global.best_score:
		Global.best_score = Global.score
		Global.save_score()
		
	$MarginContainer2/best_scorelabel.text = $MarginContainer2/best_scorelabel.text+ str(Global.best_score)
		
	#waite and show press space
	$MarginContainer/Label.hide()
	await get_tree().create_timer(2).timeout
	$MarginContainer/Label.show()
	
	
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
			get_tree().quit()
			
#func _process(_delta: float) -> void:
	#if Input.is_action_just_pressed("Shoot"):
		#get_tree().change_scene_to_packed(level_scene)
		
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Shoot") and $MarginContainer/Label.is_visible_in_tree():
		#await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_packed(level_scene)
	

	


func _on_homeorigin_pressed() -> void:
	$click_tohome.play()
	await get_tree().create_timer(0.25).timeout
	get_tree().change_scene_to_file("res://scense/home.tscn")


func _on_homeorigin_mouse_entered() -> void:
	$hover_tohome.play()

# Score check if the best
#if Global.score > Global.best_score:
		 #Global.best_score = Global.score
		 #$MarginContainer2/best_scorelabel.text = $MarginContainer2/best_scorelabel.text +str(Global.score)
		 #Global.save_score()
