extends RigidBody2D
	
# Called when the node enters the scene tree for the first time.
func _ready():
	if position.y < -150:
		queue_free()
func _process(delta):
	linear_velocity.y = -Global.cloud_speed
