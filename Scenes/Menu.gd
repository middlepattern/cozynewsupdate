extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	AudioStreamManager.play("res://Inputs/Audio/61322__mansardian__news-end-signature.wav")
	pass

func _on_StartButton_pressed():
	SceneChanger.change_scene("res://Scenes/Game.tscn")


func _on_CreditsButton_pressed():
	SceneChanger.change_scene("res://Scenes/Credits.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_focus_entered():
	AudioStreamManager.play("res://Inputs/Audio/UI/tick_001.ogg")
