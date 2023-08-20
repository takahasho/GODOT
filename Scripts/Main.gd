extends Node

var cloud 

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.game_start and !Global.landing:
		$AnimatedSprite2D.position.y -= Global.fall_speed
	if Global.cloud_generate:
		cloud_generate()
	if $AnimatedSprite2D.position.y < -2520 :
		Global.landing = true

func new_game():
	randomize()
	Global.game_start = false
	Global.landing = false

func cloud_generate():
	match randi_range(0,2):
		0:
			cloud = preload("res://Scenes/Cloud1.tscn").instantiate()
		1:
			cloud = preload("res://Scenes/Cloud2.tscn").instantiate()
		2:
			cloud = preload("res://Scenes/Cloud3.tscn").instantiate()
	$CloudPath/PathFollow2D.progress_ratio = randf_range(0,1)

	var position = $CloudPath/PathFollow2D.position
	cloud.position = position

	add_child(cloud)
	Global.cloud_generate = false
