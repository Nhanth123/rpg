extends Control


func _on_btn_start_button_up():
	for scene in get_tree().root.get_children():
		scene.queue_free()
	get_tree().call_deferred("change_scene_to_file", "res://Gameplay/Scene/GameScene.tscn")

func _on_btn_quit_button_up():
	get_tree().quit()
