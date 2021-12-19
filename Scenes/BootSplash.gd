extends Node2D

onready var logo = $AnimatedSprite
onready var audio = $AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	logo.play()
	yield (get_tree().create_timer(.2), "timeout")
	audio.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_NextSceneTimer_timeout():
	print("scene switch")
