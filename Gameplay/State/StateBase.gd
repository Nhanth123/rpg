class_name StateBase
extends Node3D

var state_machine: StateMachine
var character: CharacterBody3D
var animationPlayer: AnimationPlayer

@export var animationName: String = ''

func enter():
	#print("Entering state: ", name)
	animationPlayer.play(animationName)
	#print(character.name, " is playing ", animationPlayer.current_animation)
	pass

func exit():
	#print("Exiting state: ", name)
	pass
	
func state_update(_delta: float):
	pass

func showInfo():
	print(name, " / ", character, " / ", state_machine)
