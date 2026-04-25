extends Node3D

var spawnPoints: Array[Node]

var enemyNodes: Array[Node]

var hasSpawned: bool

func _ready():
	spawnPoints = get_node("SpawnPoints").get_children()
	
	
func _process(delta):
	pass
	

func _on_spawn_tigger_zone_body_entered(body):
	if hasSpawned:
		return
	
	if body.is_in_group("Player"):
		Spawn()

func Spawn():
	for point in spawnPoints:
		SpawnEnemyAt(point)
	hasSpawned = true

func SpawnEnemyAt(targetPoint: Node):
	var enemyToSpawn = preload("res://Gameplay/Scene/Enemy.tscn")
	var enemyInstance = enemyToSpawn.instantiate()
	get_tree().get_root().get_node("Node3D").add_child(enemyInstance)
	
	enemyInstance.global_position = targetPoint.global_position
	enemyNodes.append(enemyInstance)
