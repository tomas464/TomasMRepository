extends Node3D

@onready var ShotA1 = $Sketchfab_Scene/AnimationPlayer
@onready var AimA = $Sketchfab_Scene/AimAnim
@onready var RayCast = $"Sketchfab_Scene/Sketchfab_model/810f0276179d4425a118b331d5f38189_fbx/Object_2/RootNode/Rig/Object_8/Skeleton3D/Object_97/RayCast3D"
@onready var FMS = $FiremodeChange
@onready var b_decal = preload("res://bullet_decal.tscn")


var can_shoot = true 
var ammo = 30
var difference = 30 - ammo
var fire_mode = 0
var bullet_spread = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ammo == 0:
		can_shoot = false
	
	if Input.is_action_just_pressed("ak_fire_mode"):
		FMS.playing = true
		fire_mode = 1
		print("firemode1")
	if Input.is_action_just_pressed("ak_fire_mode2"):
		FMS.playing = true
		fire_mode = 0
		print("firemode0")

func _physics_process(delta):
	if fire_mode == 0:
		if Input.is_action_just_pressed("fire") and can_shoot:
			ShotA1.play("Rig|AK_Shot")
			
	
			
			
			RayCast.rotation.y = randi_range(-1, 1)

			
			
			
			if RayCast.is_colliding():
				var target = RayCast.get_collider()
				if target.is_in_group("Barrel"):
					target.health -= 1
					
			var b2 = b_decal.instantiate()
			RayCast.get_collider().add_child(b2) 
			b2.global_transform.origin = RayCast.get_collision_point()
			b2.look_at(RayCast.get_collision_point() + RayCast.get_collision_normal(), Vector3.UP)
					
					
					
	
	if fire_mode == 1:
		if Input.is_action_pressed("fire"):
			if !ShotA1.is_playing():
	
				ShotA1.play("Rig|AK_Shot")
				if RayCast.is_colliding():
					var target = RayCast.get_collider()
					if target.is_in_group("Barrel"):
						target.health -= 1
						
			var b2 = b_decal.instantiate()
			RayCast.get_collider().add_child(b2) 
			b2.global_transform.origin = RayCast.get_collision_point()
			b2.look_at(RayCast.get_collision_point() + RayCast.get_collision_normal(), Vector3.UP)
				
						
						
		else:
			ShotA1.play("Rig|AK_Idle")
	
	if Input.is_action_just_pressed("aim"):
		AimA.play("Aim")
		
	if Input.is_action_just_released("aim"):
		AimA.play_backwards("Aim")
		


