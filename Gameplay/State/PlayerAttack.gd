extends StateBase

@export var hiBoxCollisionShap: CollisionShape3D
@export var bladeMaterialEffectAnimationPlayer: AnimationPlayer
@export var VFX_Blade : Node3D

func enableHitBox():
	hiBoxCollisionShap.disabled = false

func disableHitBox():
	hiBoxCollisionShap.disabled = true

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
		
	
	
