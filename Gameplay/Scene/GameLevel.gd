extends Node3D

@export var player: PlayerCharacter
@export var gameUIManager: GameUIManager
@onready var portal: Portal = $Portal

var paused: bool :
	set(new_value):
		paused = new_value
		gameUIManager.togglePauseUI(paused)
		get_tree().paused = paused

func _ready():
	portal.playerReachedPortal.connect(gameIsFinished)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		paused = true

func gameIsFinished():
	get_tree().paused = true
	gameUIManager.toggleGameFinishUI(true)

func _on_btn_restart_button_up():
	print('btn restart clicked')


func _on_btn_main_menu_button_up():
	print('btn main clicked')


func _on_bth_resume_button_up():
	paused = false
