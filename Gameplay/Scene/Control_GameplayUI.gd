class_name GameUIManager
extends Node3D

@onready var coinLabel: Label = $Control_GameplayUI/HBoxContainer/Label
@onready var healthBar: ProgressBar = $Control_GameplayUI/HBoxContainer_Health/ProgressBar
@export var player: Node3D

@onready var blackColorRect: ColorRect = $Control_Game/ColorRect
@onready var gamePause: Container = $Control_Game/GamePause
@onready var gameFinish: Container = $Control_Game/GameFinish
@onready var gameOver: Container = $Control_Game/GameOver


func togglePauseUI(toggle: bool):
	blackColorRect.visible = toggle
	gamePause.visible = toggle

func toggleGameOverUI(toggle: bool):
	blackColorRect.visible = toggle
	gameOver.visible = toggle
	
func toggleGameFinishUI(toggle: bool):
	blackColorRect.visible = toggle
	gameFinish.visible = toggle


func _ready():
	player.coinNumberUpdate.connect(UpdateLabelCoin)
	player.playerHealthUpdated.connect(UpdateHealthBar)
	
	UpdateHealthBar(player.currentHealth, player.maxHealth)
	
	togglePauseUI(false)
	toggleGameOverUI(false)
	toggleGameFinishUI(false)
	

func UpdateLabelCoin(newvalue: int):
	coinLabel.text = str(newvalue)

func UpdateHealthBar(newValue: int, maxValue: int):
	var value = float(newValue) / float(maxValue) * 100
	healthBar.value = int(value)
