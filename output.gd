extends RichTextLabel
var time
var position
var speed
var a
var alpha

func _ready():
	pass # Replace with function body.

func _process(delta):
	time = get_node("../line/sphere").t
	position = get_node("../line/sphere").position.x
	speed = get_node("../line/sphere").speed
	a = get_node("../line/sphere").a
	alpha = get_node("../line/sphere").alpha
	text = "time: " + str(time) + "\npos: " + str(position) + "\nspeed: " + str(speed) +"\naccel: " + str(a) + "\nangle: " + str(alpha)
	pass
