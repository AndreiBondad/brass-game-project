extends VBoxContainer


func _on_main_text_game_over() -> void:
	print("game over")
	$Choice1.disabled = true
	$Choice2.disabled = true
	$Choice3.disabled = true
