extends Node3D

@onready var animationPlayer : AnimationPlayer = $AnimationPlayer

func _ready():
	await get_tree().create_timer(3).timeout
	open()
	
func open():
	animationPlayer.play('Open')
