extends CharacterBody3D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speed = 4.0
var mouse_sensitivity = 0.002 #look around ?

func get_input():
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction = transform.basis * Vector3(input.x, 0, input.y)
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	
func _input(event):
	print(event.as_text())
	
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	
	
