extends CharacterBody3D

const SPEED = 0.8

@onready var navigation_agent_3d = $NavigationAgent3D
@onready var player : Node3D
@onready var visual: Node3D = $VisualNode
@onready var animationPlayer : AnimationPlayer = $VisualNode/AnimationPlayer

var direction: Vector3
var stopDistance : float = 2.2

func _ready():
	player = get_tree().get_first_node_in_group("Player")

func _physics_process(delta):
	navigation_agent_3d.target_position = player.global_position

	direction = navigation_agent_3d.get_next_path_position() - global_position
	direction.normalized()
	
	if navigation_agent_3d.distance_to_target() < stopDistance:
		animationPlayer.play("NPC_01_IDEL")
		return

	velocity = velocity.lerp(direction * SPEED, delta)
	animationPlayer.play("NPC_01_WALK")
	
	if velocity.length() > 0.2:
		var lookDir = Vector2(velocity.z, velocity.x)
		visual.rotation.y = lookDir.angle()
	move_and_slide()
