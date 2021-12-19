extends Node2D

onready var timer = $Timer
onready var scriptbar = $ScriptBar
onready var background = $Background

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Timer_timeout():
	yield (get_tree().create_timer(.66), "timeout")
	winconditioncheck()
	AudioStreamManager.play("res://Inputs/Audio/UI/325113__fisch12345__error.wav")
	yield (get_tree().create_timer(2), "timeout")



func winconditioncheck():
	#get words left on the current level...a chance this could not work
	var wordleft = scriptbar.temp_level
	
	if wordleft.size() == 0:
		SceneChanger.change_scene("res://Scenes/WinScene.tscn")
	elif wordleft.size() > 0:
		SceneChanger.change_scene("res://Scenes/FailScreen.tscn")
