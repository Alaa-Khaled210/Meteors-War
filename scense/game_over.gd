extends Control

@export var level_scene : PackedScene 

# Called every frame. 'delta' is the elapsed time since the previous frame.\
var strList = ["Donot worry you are still amazing in my eyes",
"谢谢，你辛苦了","I'm proud of you " ,
"Thank you for being alife for this period you are fighter and i know"]
func _ready() -> void:
	# quote
	#for quote in $Panel/quates.get_children():
		#$Panel/quote1.text=quote.show()
		#define a RNG variable
	var rng = RandomNumberGenerator.new()

	#genreate time-based seed, otherwise the same random sequence of 
	#test will always be shown
	rng.randomize()

	#generate a randon integer to be used as an index
	var ix = rng.randi_range(0,strList.size()-1)	
	var randomStr  = strList[ix]
	$Panel/quote1.text=randomStr
	
	#to concatenate label title score with value of score
	$CenterContainer/VBoxContainer/Label2.text=$CenterContainer/VBoxContainer/Label2.text +str(Global.score)
	
	#waite and show press space
	$MarginContainer/Label.hide()
	await get_tree().create_timer(2).timeout
	$MarginContainer/Label.show()
	
	
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
