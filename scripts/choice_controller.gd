extends VBoxContainer


func _on_main_text_game_over() -> void:
	$Choice1.disabled = true
	$Choice1.visible = false
	$Choice2.disabled = true
	$Choice2.visible = false
	$Choice3.disabled = true
	$Choice3.visible = false
