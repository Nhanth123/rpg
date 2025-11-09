extends CharacterBody3D

const SPEED = 5.0

@onready var navigation_agent_3d = $NavigationAgent3D
@onready var player : Node3D

var direction: Vector3
var stopDistance : float = 2.2

func _ready():
	player = get_tree().get_first_node_in_group("Player")

func _physics_process(delta):
	navigation_agent_3d.target_position = player.global_position

	direction = navigation_agent_3d.get_next_path_position() - global_position
	direction.normalized()
	
	if navigation_agent_3d.distance_to_target() < stopDistance:
		return

	velocity = velocity.lerp(direction * SPEED, delta)
	
	move_and_slide()
