extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
@export var speed := 500
var can_shoot: bool = true

signal laser(pos)

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
	

func _on_laser_timer_timeout() -> void:
	can_shoot = true
