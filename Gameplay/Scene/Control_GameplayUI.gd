extends Control

@onready var coinLabel: Label = $HBoxContainer/Label
@export var player: Node3D

func _ready():
	player.coinNumberUpdate.connect(UpdateLabelCoin)

func UpdateLabelCoin(newvalue: int):
	coinLabel.text = str(newvalue)
