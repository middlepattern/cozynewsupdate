extends CanvasLayer

signal scene_changed()

onready var anim = $AnimationPlayer
onready var black = $Control/ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play_backwards("fade")
	pass # Replace with function body.

func change_scene(path, delay = 0.4):
	yield (get_tree().create_timer(delay), "timeout")
	anim.play("fade")
	yield(anim, "animation_finished")
	assert(get_tree().change_scene(path) == OK)
	anim.play_backwards("fade")
	yield(anim, "animation_finished")
	emit_signal("scene_changed")
