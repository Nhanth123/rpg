class_name StateBase

extends Node
var state_machine: StateMachine
var character: CharacterBody3D
var animationPlayer: AnimationPlayer

@export var animationName: String = ''

func enter():
	print("Enter state: ", name)
	animationPlayer.play(animationName)

func exit():
	print("Exiting state: ", name)
	pass

func state_update(_detal: float):
	pass

func showInfo():
	print(name, "/ ", character, " /", state_machine)
