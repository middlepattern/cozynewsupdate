extends VBoxContainer

signal mouth_it

onready var timebar = $Margin/TimeBar
onready var word = $Word
onready var action = $Action
onready var sound = $Sound
onready var scriptbar = get_parent()

var sound_remain = 0
var correct_input = false

var rng = RandomNumberGenerator.new()
var input_goal
var active_target = false
var xbox_font_dict = {"up": "W", 
				"left": "A",
				"down": "X",
				"right": "D",
				"a" : "a",
				"y" : "y",
				"x" : "x",
				"b" : "b",
				"left_bump" : "[",
				"right_bump" : "]"}
				
var keyboard_font_dict = {"up": "W", 
				"left": "A",
				"down": "S",
				"right": "D",
				"a" : "r",
				"y" : "q",
				"x" : "s",
				"b" : "t",
				"left_bump" : "[",
				"right_bump" : "]"}

# Called when the node enters the scene tree for the first time.
func _ready():
	sound.connect("finished", self, "_audiofinished")

func prepare_self(a, b, c):
	word.text = " " + a + " "
	action.text = str(control_to_font_converter(b))
	sound.stream = load("res://Inputs/Audio/readsplit/" + c)
	input_goal = str(b)
	timebar.max_value = sound.stream.get_length()

func _process(delta):
	position_check()
	timebar_change()

func position_check():
	if self.get_index() == 0:
		active_target = true
		word.set("custom_colors/font_outline_modulate", Color.orange)

func timebar_change():
	timebar.value = sound.get_playback_position()

func _unhandled_input(event):
	if event.is_action_pressed(input_goal) && active_target == true:
		sound.play()
		mouth_message(quick_random(0,7))
		correct_input = true


func made_mistake():
	AudioStreamManager.play("res://Inputs/Audio/572936__bloodpixelhero__error.wav")
	

#rolls a quick random number for moving face
func quick_random(low, high):
	rng.randomize()
	var x = rng.randi_range(low, high)
	return x
	
#sends a req for a new mouth shape on panda
func mouth_message(x):
	get_tree().call_group("mouth", "mouthshape", x)

func _audiofinished():
	scriptbar.temp_level.pop_front() #remove word from array
	if scriptbar.get_child_count() == 1: #checks if last one in the line
		scriptbar.prep_level()
	mouth_message(8) #calls a flat rest face
	queue_free()

func control_to_font_converter(x):
	var symbol = keyboard_font_dict.get(x)
	return symbol
