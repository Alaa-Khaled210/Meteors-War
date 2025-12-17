extends Control

var scene_path ="res://scense/home.tscn"
@onready var progress_bar: ProgressBar = $ProgressBar
var lastprogress =0.0
var reached_100:= false
func _ready() -> void:
	MusicGame.stop_music()
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
		ResourceLoader.load_threaded_request(scene_path)

func _process(_delta: float) -> void:
	var progress=[]
	var loadeed_status =ResourceLoader.load_threaded_get_status(scene_path,progress)
	var new_progress= progress[0] * 100
	if new_progress > lastprogress :
		lastprogress = new_progress
	
	progress_bar.value=lerp(progress_bar.value,new_progress,_delta*5)
	
	if loadeed_status==ResourceLoader.ThreadLoadStatus.THREAD_LOAD_LOADED and not reached_100 :
		if new_progress >=100 :
			reached_100=true
			progress_bar.value= 100.0
		var next_scene=ResourceLoader.load_threaded_get(scene_path)
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_packed(next_scene)
		MusicGame.play_home_music()
			
		
		
		
		
		
		
	
