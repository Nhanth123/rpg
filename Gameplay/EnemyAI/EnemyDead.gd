extends StateBase


@export var collisionShape3D: CollisionShape3D
@export var materialEffectAnimationPlayer: AnimationPlayer


func enter():
	super.enter()
	character.velocity = Vector3.ZERO
	
	collisionShape3D.disabled = true
	
	await get_tree().create_timer(1).timeout
	materialEffectAnimationPlayer.play('Dead')
	
	await get_tree().create_timer(3).timeout
	
	var dropitem= preload("res://Asset/VFX/Scene/collectable_healing_orb.tscn")
	
	var dropitemInstance = dropitem.instantiate()
	get_tree().get_root().get_node("Node3D").add_child(dropitemInstance)
	dropitemInstance.global_position = character.global_position
	
	
	character.queue_free()
	
