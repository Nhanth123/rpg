extends StateBase

@export var hitBoxCollisionShape: CollisionShape3D
@export var bladeMaterialEffectAnimationPlayer: AnimationPlayer
@export var VFX_Blade : Node3D

var damage: int = 40

func enableHitBox():
	hitBoxCollisionShape.disabled = false
	print("hit box disable = ", hitBoxCollisionShape.disabled)

func disableHitBox():
	hitBoxCollisionShape.disabled = true
	print("hit box disable = ", hitBoxCollisionShape.disabled)

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
	if body.is_in_group("Enemy"):
		body.applyDamge(damage)
