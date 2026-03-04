extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
@export var speed := 500
var can_shoot: bool = true

signal laser(pos)

@onready var pasue: CanvasLayer = $pasue
var	 paused = false
var health: int = 4
@onready var playerimg: Sprite2D = $playerimg
#var original_color = Color.WHITE

func _ready() -> void:

	position=Vector2(597,543)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right","up","down")
	velocity = direction * speed 
	move_and_slide()  # must after velocity to see afttect of collision shape
	
	# shooting input
	if Input.is_action_just_pressed("Shoot") and can_shoot:
		laser.emit($LaserStartPos.global_position)
		can_shoot = false
		$LaserTimer.start()
		$LaserSound.play()
		
	#pasue game ------------------
	if Input.is_action_just_pressed("pasue"):
		pausemenue()
	
func pausemenue():
	if paused:
		pasue.hide()
		Engine.time_scale= 1
	else :
		pasue.show()
		Engine.time_scale=0
	paused = !paused
######################

func _on_laser_timer_timeout() -> void:
	can_shoot = true

func apply_damage(amount):
	health -=amount
	flash_led()
	get_tree().call_group('Ui','set_health',health)
	if health <=0 :
		get_tree().call_deferred("change_scene_to_file","res://scense/game_over.tscn")

func flash_led():
	playerimg.modulate = Color(1, 0, 0)
	await get_tree().create_timer(0.2).timeout
	playerimg.modulate = Color.WHITE
	#await get_tree().create_timer(0.1).timeout
