extends CheckButton
export var inclane_edit: bool = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var inclane_edit
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (pressed == false):
		get_node("../Slider_inclane").editable = true
		get_node("../Slider_fixed").editable = false
		inclane_edit = true
		Global.choice_uprav = true
	else:
		get_node("../Slider_inclane").editable = false
		get_node("../Slider_fixed").editable = true
		inclane_edit = false
		Global.choice_uprav = false
	pass
