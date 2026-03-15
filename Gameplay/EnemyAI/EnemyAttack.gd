extends StateBase

@export var hitBoxCollisionShap : CollisionShape3D
@export var vfxAnimationPlayer: AnimationPlayer

var damage: int = 30
var lookDir: Vector3
var lookDir2D: Vector2

func state_update(_delta:float):
	if animationPlayer.is_playing() == false:
		state_machine.switchTo('ChasePlayer')
	if character.currentHealth == 0:
		state_machine.switchTo('Dead')

func enableHitBox():
	hitBoxCollisionShap.disabled = false
	
func disableHitBox():
	hitBoxCollisionShap.disabled = true
	
func enter():
	super.enter()
	
	character.velocity = Vector3.ZERO
	lookDir = character.player.global_position - character.global_position
	lookDir2D = Vector2(lookDir.z , lookDir.x)
	character.visual.rotation.y = lookDir2D.angle()

func exit():
	super.enter()
	disableHitBox()
	
func _on_hit_box_body_entered(body):
	if body.is_in_group('Player'):
		body.takeDamage(damage, character.global_position)
		
func playSmashVFX():
	vfxAnimationPlayer.play('PlayParticle')
