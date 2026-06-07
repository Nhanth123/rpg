extends Node3D

@export var player: PlayerCharacter
@export var gameUIManager: GameUIManager
@onready var portal: Portal = $Portal

# Called when the node enters the scene tree for the first time.
func _ready():
	portal.playerReachedPortal.connect(gameIsFinished)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func gameIsFinished():
	get_tree().paused = true
	gameUIManager.toggleGameFinishUI(true)

func _on_btn_restart_button_up():
	print('btn restart clicked')


func _on_btn_main_menu_button_up():
	print('btn main clicked')


func _on_bth_resume_button_up():
	print('btn resume clicked')
