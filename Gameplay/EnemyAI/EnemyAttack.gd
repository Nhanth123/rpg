extends StateBase

@export var hitBoxCollisionShap : CollisionShape3D


var damage: int = 30
var lookDir: Vector3
var lookDir2D: Vector2

func enableHitBox():
	hitBoxCollisionShap.disabled = false
	
func disableHitBox():
	hitBoxCollisionShap.disabled = true
	
func enter():
	super.enter()
	
	character.velocity = Vector3.ZERO
	lookDir = character.player.global_position - character.global_position
	character.visual.rotation.y = lookDir2D.angle()

func exit():
	super.enter()
	disableHitBox()
	
	
