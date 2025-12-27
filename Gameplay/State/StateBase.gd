class_name StateBase

extends Node

var state_machine: StateMachine
var character: CharacterBody3D
var animationPlayer: AnimationPlayer

@export var animationName: String = ''

func enter():
	print("Entering state: ", name)
	animationPlayer.play(animationName)
	print(character.name, " is playing ", animationPlayer.current_animation)

	#print(animationPlayer.name)
	#print(animationPlayer.get_parent())
	#print(animationPlayer.get_animation_list())
	pass

func exit():
	print("Exiting state: ", name)
	pass
	
func state_update(_delta: float):
	pass

func showInfo():
	print(name, " / ", character, " / ", state_machine)
