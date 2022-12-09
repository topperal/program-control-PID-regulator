extends Line2D
var final_pos: float

func _ready():
	if (Global.choice_uprav == false):
		rotation = get_node("sphere").alpha
	pass

func _process(delta):
	if (Global.choice_uprav == false):
		rotation = get_node("sphere").alpha * PI/180
	pass
	
#слайдер программного управления
func _on_HSlider_value_changed(value):
	$sphere.alpha = value
	pass

#слайдер стабилизации
func _on_Slider_fixed_value_changed(value):
	get_node("sphere").final_pos = value
	pass # Replace with function body.


func _on_move_or_fixed_pressed():
	pass # Replace with function body.
