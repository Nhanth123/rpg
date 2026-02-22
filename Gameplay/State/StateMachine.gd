class_name StateMachine
extends Node

@export var initial_state = NodePath()
@onready var current_state:StateBase = get_node(initial_state)

func _ready() -> void:
	for child in get_children():
		child.state_machine = self
		child.character = get_parent()
		child.animationPlayer = get_parent().get_node("VisualNode/AnimationPlayer")
		#child.showInfo()
	
	current_state.enter()
	
func _physics_process(delta: float) -> void:
	current_state.state_update(delta)
	
func switchTo(targetState: String):
	if not has_node(targetState):
		print("Could not find the target state node")
		return

	current_state.exit()
	current_state = get_node(targetState)
	current_state.enter()
