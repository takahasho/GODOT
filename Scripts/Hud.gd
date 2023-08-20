extends CanvasLayer

var diff_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$StartButton.show()
	$CloudTimer.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.game_start:
		Global.score_time = (Time.get_ticks_msec() - diff_count) / 1000
		$Message.text = str(Global.score_time);

func _on_start_button_button_down():
	Global.game_start = true
	diff_count = Time.get_ticks_msec()
	$StartButton.hide()
	$CloudTimer.start()


func _on_cloud_timer_timeout():
	Global.cloud_generate = true
