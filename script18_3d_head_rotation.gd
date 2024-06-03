extends Node3D

@onready var cam = $Camera3D
@onready var ch3d = $".."

var v = Vector3()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
 
func _input(event):
	if event is InputEventMouseMotion:
		v.y -= (event.relative.x * 0.2)
		v.x -= (event.relative.y * 0.2)
		v.x = clamp(v.x,-80,90)
func _physics_process(delta):
	cam.rotation_degrees.x = v.x
	ch3d.rotation_degrees.y = v.y
