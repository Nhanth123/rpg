class_name StateBase

extends Node
var state_machine: StateMachine
var character: CharacterBody3D
var animationPlayer: AnimationPlayer

@export var animationName: String = ''

func enter():
	print("Enter state: ", animationName)
	animationPlayer.play(animationName)
	pass

func exit():
	print("Exiting state:", animationName)
	pass

func state_update(_detal: float):
	pass

func showInfo():
	print(animationName, "/", character, "/", state_machine)
