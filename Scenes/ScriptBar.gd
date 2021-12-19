extends HBoxContainer

onready var globalscript = get_node("/root/SingletonImportdata").script_data #gets data from singleton
const blank = preload("res://Scenes/Blank.tscn") #preloads a blankword scene for instancing

var trigger_levels = ["I", "K", "N", "Q"]
var level_array = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
"K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
var temp_level = [] #create an empty dictionary for the temporary level (not sure if I'll need it)

# Called when the node enters the scene tree for the first time.
func _ready():
	prep_level()
#	for i in globalscript: #iterate through the json file extraction
#		if i[0] == "A": #grab all the keys that start with A
#			temp_level.append(globalscript[i]) #add those entries to the 'temp level'. this now contains all A's.
#		else:
#			pass
#	add_blanks()

func prep_level():
	for i in globalscript:
		if i[0] == level_array[0]: #grab all the keys that start with A
			temp_level.append(globalscript[i]) #add those entries to the 'temp level'. this now contains all A's.
		else:
			pass
	add_blanks()
	level_array.pop_front() # removes first letter from Level (A, B, C)
	slide_check()
#	print(level_array)

func add_blanks(): #adds words
	for i in temp_level:
		var b = blank.instance()
		self.add_child(b)
		b.prepare_self(i.Word, i.Action, i.File)

func slide_check():
	for i in trigger_levels:
		if level_array[0] == i:
			get_tree().call_group("background", "remove_firstslide")
