extends Control

@export var level_scene : PackedScene 

# Called every frame. 'delta' is the elapsed time since the previous frame.\
func _ready() -> void:
	$CenterContainer/VBoxContainer/Label2.text=$CenterContainer/VBoxContainer/Label2.text +str(Global.score)
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
