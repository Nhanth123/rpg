extends StateBase

@export var hitBoxCollisionShape: CollisionShape3D
@export var bladeMaterialEffectAnimationPlayer: AnimationPlayer
@export var VFX_Blade : Node3D
@export var VFX_Hit: GPUParticles3D

var damage: int = 10
var slideSpeed: float = 500
var remainSlideDuration: float
var facingDir: Vector3

func enableHitBox():
	hitBoxCollisionShape.disabled = false
	#print("hit box disable = ", hitBoxCollisionShape.disabled)

func disableHitBox():
	hitBoxCollisionShape.disabled = true
	#print("hit box disable = ", hitBoxCollisionShape.disabled)


func enter():
	super.enter()
	
	character.velocity.x = 0
	character.velocity.z = 0
	VFX_Blade.visible = true
	bladeMaterialEffectAnimationPlayer.stop()
	bladeMaterialEffectAnimationPlayer.play("PlayBladeVFX")
	
	remainSlideDuration = animationPlayer.current_animation_length * 0.3

func exit():
	super.enter()
	disableHitBox()
	VFX_Blade.visible = false
	
func state_update(_delta:float):
	remainSlideDuration -= _delta
	facingDir = character.visual.transform.basis.z
	if remainSlideDuration > 0:
		character.velocity.x = facingDir.x * slideSpeed * _delta
		character.velocity.z = facingDir.z * slideSpeed * _delta
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, character.SPEED)
		character.velocity.z = move_toward(character.velocity.z, 0, character.SPEED)
	
	
	if animationPlayer.is_playing() == false:
		state_machine.switchTo("Idle")


func _on_hit_box_body_entered(body):
	var test_a = body.is_in_group("Enemy")
	print('is in group enyemy:', test_a)
	if body.is_in_group("Enemy"):
		print('damage: ', damage)
		body.applyDamge(damage)
		
		var position_body = body.global_position
		position_body.y = 1.5
		VFX_Hit.global_position = position_body.y
		VFX_Hit.restart()
		remainSlideDuration = 0
