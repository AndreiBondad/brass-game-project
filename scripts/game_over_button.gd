extends Button


func _on_main_text_game_over() -> void:
	self.disabled = false
	self.visible = true


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_game_scene.tscn")
