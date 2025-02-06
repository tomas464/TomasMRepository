extends Node3D


@onready var cam = $"."
@onready var ch3d = $".."
@onready var raycast = $Camera3D/RayCast3D
@onready var hand = $Hand
var v = Vector3()
var sens = 0.12


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$"../Idle Aiming (1)/Skeleton3D/SkeletonIK3D".start()
func _process(delta):
	$".".rotation_degrees.x = v.x
	ch3d.rotation_degrees.y = v.y

	
	var object = raycast.get_collider()
	if raycast.is_colliding():
		if object.is_in_group("pickable"):
			if Input.is_action_pressed("Interact"):
				object.global_position = hand.global_position
				object.global_rotation = hand.global_rotation
				object.collision_layer = 2
				object.linear_velocity = Vector3(0.1, 3, 0.1)
				
	if Input.is_action_just_pressed("Aim"):
		$AimAnim.play("Aim")
	if Input.is_action_just_released("Aim"):
		$AimAnim.play_backwards("Aim")



func _input(event):
	if event is InputEventMouseMotion:
		v.y -= (event.relative.x * sens)
		v.x -= (event.relative.y * sens)
		v.x = clamp(v.x,-40,40)
