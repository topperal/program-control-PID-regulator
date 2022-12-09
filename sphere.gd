extends Sprite
#описание поля
var g: float = 9.81
var mass: float = 50
var radius: float = 30
var alpha = rotation_degrees setget _set_alpha
# скорость
#var alpha = 0
var speed: float = 1
var angle_speed
#ускорение
var I = 1/2*mass*radius*radius
var a

var x_new = 0
var x_incline = 0
var left_bound = -80.17
var right_bound = 195
#переменные для ПИД-регулятора
var final_pos: float 
var t = 0
#var prev_pos = -80.17

func _ready():
	x_incline = position.x
	pass
	
func acceleration(alpha):
	a = (g*sin(alpha*PI/180))/(1+I/(mass*radius*radius))

func _set_alpha(value):
	alpha = value
	get_node("../../Slider_inclane").value = alpha
	get_node("..").rotation_degrees = alpha

func _simplePID(delta: float):
	acceleration(alpha)
	alpha -= (position.x - final_pos)* 0.01 + a * 0.6 + speed * 0.6
	_move_sphere(alpha, delta)
	t += delta

func _move_sphere(alpha: float, delta: float):
	if Input.is_action_pressed("ui_left"):
		self.alpha = alpha - 1
	if Input.is_action_pressed("ui_right"):
		self.alpha = alpha + 1
	acceleration(alpha)
	
	if position.x < left_bound:
		if a <= 0 or (a>=0 and speed <0):
			speed = 0
			a = 0
			x_new += left_bound - position.x
	if position.x > right_bound:
		if a>=0 or (a<=0 and speed > 0):
			speed = 0
			a = 0
			x_new += right_bound - position.x

	speed += a* delta
	x_new += speed
	angle_speed = speed / radius
	rotation += angle_speed
	position.x = x_new * cos(alpha*PI/180) + x_incline
	t += delta

func _process(delta):
	#программное управление
	if (Global.choice_uprav):
		_move_sphere(alpha, delta)
	else:
	#стабилизация
		_simplePID(delta)
	if Input.is_action_pressed("ui_down"):
		get_tree().reload_current_scene()
