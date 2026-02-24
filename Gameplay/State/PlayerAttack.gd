extends StateBase

@export var hitBoxCollisionShape: CollisionShape3D
@export var bladeMaterialEffectAnimationPlayer: AnimationPlayer
@export var VFX_Blade : Node3D
@export var VFX_Hit: GPUParticles3D
@export var nextAttackState : String
var can_attack_again : bool


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
	
	can_attack_again = false
	
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
		
	if nextAttackState != '' && can_attack_again && character.attackKey_pressed:
		state_machine.switchTo(nextAttackState)

func _on_hit_box_body_entered(body):
	if body.is_in_group("Enemy"):
		body.applyDamge(damage)
		
		var bodyPosition = body.global_position
		bodyPosition.y += 1.5
		VFX_Hit.global_position = position
		VFX_Hit.restart()
		remainSlideDuration = 0

func set_CanAttackAgain():
	can_attack_again = true
