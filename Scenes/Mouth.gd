extends Sprite

var mouth_dict = {
0: ["IH"],
1: ["OH"],
2: ["HH"],
3: ["OO"],
4: ["J"],
5: ["LL"],
6: ["BM"],
7: ["TH"]
}



# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("mouth")
	self.frame = 8

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func mouthshape(x):
	self.frame = x
