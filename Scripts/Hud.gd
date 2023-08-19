extends CanvasLayer

var diffcount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$StartButton.show()
	$CloudTimer.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Grobal.game_start:
		$Message.text = str((Time.get_ticks_msec() - diffcount) / 1000);

func _on_start_button_button_down():
	Grobal.game_start = true
	diffcount = Time.get_ticks_msec()
	$StartButton.hide()
	$CloudTimer.start()


func _on_cloud_timer_timeout():
	Grobal.cloud_generate = true
