extends Node

var score

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Grobal.game_start:
		$AnimatedSprite2D.position.y -= 3

func game_over():
	pass

func new_game():
	Grobal.game_start = false

func _on_cloud_timer_timeout():
	prints('timer0')
