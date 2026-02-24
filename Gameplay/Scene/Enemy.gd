extends CharacterBody3D

const SPEED = 0.8

@onready var navigation_agent_3d = $NavigationAgent3D
@onready var visual: Node3D = $VisualNode
@onready var animationPlayer : AnimationPlayer = $VisualNode/AnimationPlayer
@onready var materialEffectAP: AnimationPlayer = $VisualNode/MaterialEffectAnimationPlayer 

var player : CharacterBody3D
var direction: Vector3
var maxHeath: int = 100
var currentHealth: int


func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	currentHealth = maxHeath
	print('current health:', currentHealth)

func _physics_process(_delta) -> void:
	move_and_slide()
	
func applyDamge(damage: int):
	print('damage: ', damage)
	currentHealth -=  damage
	currentHealth = clamp(currentHealth, 0 , maxHeath)
	print(name, " 's health: ", currentHealth)
	materialEffectAP.play("Flash")
