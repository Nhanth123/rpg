extends Node3D

@onready var coinLabel: Label = $Control_GameplayUI/HBoxContainer/Label
@onready var healthBar: ProgressBar = $Control_GameplayUI/HBoxContainer_Health/ProgressBar
@export var player: Node3D

func _ready():
	player.coinNumberUpdate.connect(UpdateLabelCoin)
	player.playerHealthUpdated.connect(UpdateHealthBar)
	
	UpdateHealthBar(player.currentHealth, player.maxHealth)

func UpdateLabelCoin(newvalue: int):
	coinLabel.text = str(newvalue)

func UpdateHealthBar(newValue: int, maxValue: int):
	var value = float(newValue) / float(maxValue) * 100
	healthBar.value = int(value)
