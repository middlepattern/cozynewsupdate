extends Node2D

onready var anim = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("RiseIn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	SceneChanger.change_scene("res://Scenes/Menu.tscn")
