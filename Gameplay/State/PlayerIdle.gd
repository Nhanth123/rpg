extends StateBase


func state_update(_delta:float):
	if character.direction:
		state_machine.switchTo("Run")
	
	if character.slideKey_pressed:
		state_machine.switchTo("Slide")
