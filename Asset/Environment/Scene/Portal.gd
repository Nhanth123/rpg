class_name Portal
extends Node3D

var coinRequired: int = 3

@onready var textLabel : Label  =  $Sprite3D/SubViewport/Label

signal playerReachedPortal

func _ready():
	textLabel.text = str(coinRequired)
	

func _on_area_3d_body_entered(body):
	if body.is_in_group('Player'):
		if body.coinNumber >= coinRequired:
			#print('Player has reached to the portal')
			emit_signal("playerReachedPortal")
