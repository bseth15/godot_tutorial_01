extends Sprite

var angular_speed: float = PI
var speed: float = 400


func _init() -> void:
	print("Hello, world!")


func _process(delta: float) -> void:
	var direction: int = 0

	if Input.is_action_pressed("ui_left"):
		direction = 1 if Input.is_action_pressed("ui_down") else -1
	if Input.is_action_pressed("ui_right"):
		direction = -1 if Input.is_action_pressed("ui_down") else 1

	rotation += angular_speed * direction * delta

	var velocity: Vector2 = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2.DOWN

	velocity = velocity.rotated(rotation) * speed
	position += velocity * delta
