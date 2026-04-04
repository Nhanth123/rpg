extends Node3D

var healthValue: int  = 30

@onready var Visual: Node3D = $VisualNode


func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body.is_in_group("Player"):
		body.AddHealth(healthValue)
		Visual.visible = false
