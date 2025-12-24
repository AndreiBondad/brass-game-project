extends Control

class_name TextNode

var currentText = "This is the opening text"

var gameOver = false

var optionList = []

func _init(text) -> void:
	currentText = text

func set_options(optionA, optionB, optionC) -> void:
	optionList.append(optionA)
	optionList.append(optionB)
	optionList.append(optionC)
