class_name PlayerCharacter
extends CharacterBody3D

const SPEED = 5.0

@onready var visual : Node3D = $VisualNode
@onready var animationPlayer: AnimationPlayer = $VisualNode/AnimationPlayer
@onready var footstepVFX: GPUParticles3D = $VisualNode/VFX/Footstep_GPUParticles3D

var direction : Vector3
var slideKey_pressed: bool
var attackKey_pressed: bool

var coinNumber: int:
	set(newValue):
		coinNumber = newValue
		emit_signal("coinNumberUpdate", coinNumber)

signal coinNumberUpdate(newValue)

func _physics_process(_delta: float) -> void:
	if not is_on_floor():
		velocity.y -= 1

	var input_dir = Input.get_vector("Left", "Right", "Up", "Down")
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	slideKey_pressed = Input.is_action_just_pressed("Slide")
	attackKey_pressed = Input.is_action_just_pressed("Attack")
	
	move_and_slide()
	
func AddCoin(value: int):
	coinNumber += value
	#print(coinNumber)
