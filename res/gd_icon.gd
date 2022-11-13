extends Sprite

signal health_depleted
signal health_changed(old_value, new_value)

var angular_speed: float = PI
var health: float = 10.0
var speed: float = 400


func _init() -> void:
	print("Hello, world!")

func _ready() -> void:
	var timer = get_node("Timer")
	timer.connect("timeout", self, "_on_Timer_timeout")


# func _process(delta: float) -> void:
# 	var direction: int = 0

# 	if Input.is_action_pressed("ui_left"):
# 		direction = 1 if Input.is_action_pressed("ui_down") else -1
# 	if Input.is_action_pressed("ui_right"):
# 		direction = -1 if Input.is_action_pressed("ui_down") else 1

# 	rotation += angular_speed * direction * delta

# 	var velocity: Vector2 = Vector2.ZERO
# 	if Input.is_action_pressed("ui_up"):
# 		velocity = Vector2.UP
# 	if Input.is_action_pressed("ui_down"):
# 		velocity = Vector2.DOWN

# 	velocity = velocity.rotated(rotation) * speed
# 	position += velocity * delta

func _process(delta: float) -> void:
    rotation += angular_speed * delta
    var velocity = Vector2.UP.rotated(rotation) * speed
    position += velocity * delta


func take_damage(amount: float) -> void:
	var old_health: float = health
	health -= amount
	emit_signal("health_changed", old_health, health)

	if health <= 0:
		emit_signal("health_depleted")


func _on_Button_pressed() -> void:
	set_process(not is_processing())


func _on_Timer_timeout() -> void:
	visible = not visible
