extends Control

func _on_main_text_status_update() -> void:
	print("signal emitted")
	$SoldierStatuses/CortezStatus.text = "Cortez: " + $MainText.currentNode.statuses[0]
	$SoldierStatuses/JensenStatus.text = "Jensen: " + $MainText.currentNode.statuses[1]
	$SoldierStatuses/PetrovStatus.text = "Petrov: " + $MainText.currentNode.statuses[2]
	$SoldierStatuses/WuStatus.text = "Wu: " + $MainText.currentNode.statuses[3]


func _on_main_text_game_over() -> void:
	$TextChoices/Choice1.disabled = true
	$TextChoices/Choice1.visible = false
	$TextChoices/Choice2.disabled = true
	$TextChoices/Choice2.visible = false
	$TextChoices/Choice3.disabled = true
	$TextChoices/Choice3.visible = false
	
	$GameOverButton.visible = true
	$GameOverButton.disabled = false


func _on_main_text_choice_text_update() -> void:
	$TextChoices/Choice1.text = $MainText.currentNode.optionList[0].choiceText
	$TextChoices/Choice2.text = $MainText.currentNode.optionList[1].choiceText
	$TextChoices/Choice3.text = $MainText.currentNode.optionList[2].choiceText
