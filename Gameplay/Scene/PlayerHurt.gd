extends StateBase


func enter():
	super.enter()
	character.velocity  = Vector3.ZERO

func state_update(_delta: float):
	if animationPlayer.is_playing() == false:
		state_machine.switchTo('Idle')
