extends CharacterBody3D

const SPEED = 5.0

@onready var visual : Node3D = $VisualNode
@onready var animationPlayer = $VisualNode/AnimationPlayer
@onready var footstepVFX = $VisualNode/VFX/Footstep_GPUParticles3D

var coinNumber: int

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= 1

	var input_dir = Input.get_vector("Left", "Right", "Up", "Down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		animationPlayer.play("LittleAdventurerAndie_Run")
		footstepVFX.emitting = true
	else:
		velocity.x = move_toward(velocity.x, 0 , SPEED)
		velocity.z = move_toward(velocity.z, 0 , SPEED)
		animationPlayer.play("LittleAdventurerAndie_Idel")
		footstepVFX.emitting = false
		
	if velocity.length() > 0.2:
		var lookDir = Vector2(velocity.z, velocity.x)
		visual.rotation.y = lookDir.angle()
	
	move_and_slide()
	
func AddCoin(value: int):
	coinNumber += value
	print(coinNumber)
