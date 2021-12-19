extends Sprite


var slides = []


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("background")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func remove_firstslide():
	var amount_of_slides = self.get_child_count()
	self.get_child(amount_of_slides-1).queue_free()
