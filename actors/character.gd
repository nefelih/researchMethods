extends CharacterBody3D

@export var possible_items: Array[Sprite3D] = []
@export var current_item: Sprite3D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speed = 1.5
var mouse_sensitivity = 0.002 #look around ?
var inventory = []

var can_move: bool = true

func get_input():
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction = transform.basis * Vector3(input.x, 0, input.y)
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	
	
func _input(event):
	if (Input.is_action_just_pressed("pick_up") && can_move == false):
		remove_memory(current_item)
		
	
func _physics_process(delta: float) -> void:
	if (can_move):
		get_input()
		move_and_slide()


func _on_memory_detector_body_entered(body: Node3D) -> void:
	print("memory object entered")
	can_move = false
	
	#removes sprite from possible_items array and puts into inventory array
	if (possible_items):
		current_item = possible_items.pop_front()
		inventory.append(current_item)
		memory_display(current_item)

	#no more orb
	if body.is_in_group("memory"):
		body.queue_free()
		
	#emit to the stats manager
	StatsManager.connection()
	print(StatsManager.current_stat)
	
	
func memory_display(item: Sprite3D):
	$Backdrop.visible = true
	item.visible = true
	#when this is done with final images, all of the items will be the same size, however these objects are different so theyre just getting manually transformed
	
	
func remove_memory(item: Sprite3D):
	$Backdrop.visible = false
	item.visible = false
	can_move = true;
