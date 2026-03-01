extends StateBase


@export var collisionShape3D: CollisionShape3D

func enter():
	super.enter()
	character.velocity = Vector3.ZERO
	
	collisionShape3D.disabled = true
	
	await get_tree().create_timer(3).timeout
	character.queue_free()
	
