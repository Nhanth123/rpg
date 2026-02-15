extends StateBase

@export var hitBoxCollisionShape: CollisionShape3D
@export var bladeMaterialEffectAnimationPlayer: AnimationPlayer
@export var VFX_Blade : Node3D
@export var VFX_Hit: GPUParticles3D

var damage: int = 10

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

func exit():
	super.enter()
	disableHitBox()
	VFX_Blade.visible = false
	
func state_update(_delta:float):
	if animationPlayer.is_playing() == false:
		state_machine.switchTo("Idle")


func _on_hit_box_body_entered(body):
	var test_a = body.is_in_group("Enemy")
	print('is in group enyemy:', test_a)
	if body.is_in_group("Enemy"):
		print('damage: ', damage)
		body.applyDamge(damage)
		
		var position_enemy = body.global_position
		position_enemy.y = 1.5
		VFX_Hit.global_position = position_enemy.y
		VFX_Hit.restart()
