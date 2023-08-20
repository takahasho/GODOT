extends Area2D

var screen_size # Size of the game window.
var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.game_start:
		var velocity = Vector2.ZERO
		
		if Input.is_action_pressed("move_right"):
			velocity.x += 1
		if Input.is_action_pressed("move_left"):
			velocity.x -= 1
		
		get_node("AnimatedSprite2D").play()
		position += velocity * speed * delta
		position.x = clamp(position.x, 70, screen_size.x - 80)
		position.y = clamp(position.y, 0, screen_size.y)

func _on_body_entered(_body):
	$CollisionShape2D.set_deferred("disabled", true)
