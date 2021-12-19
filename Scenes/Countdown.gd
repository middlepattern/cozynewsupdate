extends Node2D

export var timer_length = 45

signal timeout

onready var timer = $Timer
onready var message = $Message
onready var progress = $TextureProgress
onready var ticker = $TickingSfx

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = timer_length
	timer.start()
	tickloop()
	progress.max_value = timer.wait_time

func _process(delta):
	message.text = str(int(timer.time_left)) + " seconds left!"
	progress.value = timer.time_left

func _on_Timer_timeout():
	emit_signal("timeout")
	timer.stop()

func tickloop():
	ticker.play()
	yield (get_tree().create_timer(.17), "timeout")
	if timer.time_left != 0:
		tickloop()
	elif timer.time_left > 0:
		return
		pass
