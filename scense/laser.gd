extends Area2D

var speed = 500
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	var tween = create_tween()
	tween.tween_property($Sprite2D,'scale' ,Vector2(0.06,0.01),0.2).from(Vector2(0,0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y -= speed * delta
