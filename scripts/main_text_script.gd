extends RichTextLabel

class TextNode:
	var currentText = "This is the opening text"

	var gameOver = false

	var optionList = []

	var statuses = ["Alive", "Alive", "Alive", "Alive"]

	func _init(nodeText) -> void:
		currentText = nodeText

	func set_options(optionA, optionB, optionC) -> void:
		optionList.append(optionA)
		optionList.append(optionB)
		optionList.append(optionC)
		
	func set_game_over_status(statusA, statusB, statusC) -> void:
		optionList[0].gameOver = statusA
		optionList[1].gameOver = statusB
		optionList[2].gameOver = statusC
	
	func set_soldier_statuses(cortezStatus, jensenStatus, petrovStatus, wuStatus):
		statuses[0] = cortezStatus
		statuses[1] = jensenStatus
		statuses[2] = petrovStatus
		statuses[3] = wuStatus

signal game_over

signal status_update

var startingNode
var currentNode
var displayText
var choiceOneNode
var choiceTwoNode
var choiceThreeNode
var displayTextLength
var count = 0;



func _ready():
	print("Main Text Ready called")
	startingNode = TextNode.new("This is the opening text")
	currentNode = startingNode
	startingNode.set_options(TextNode.new("Option A was chosen"), TextNode.new("Option B was chosen"), TextNode.new("Option C was chosen"))
	startingNode.optionList[0].set_options(TextNode.new("Option AA was chosen"), TextNode.new("Option AB was chosen"), TextNode.new("Option AC was chosen"))
	startingNode.optionList[0].set_game_over_status(true, true, true)
	startingNode.optionList[1].set_options(TextNode.new("Option BA was chosen"), TextNode.new("Option BB was chosen"), TextNode.new("Option BC was chosen"))
	startingNode.optionList[1].set_game_over_status(true, true, true)
	startingNode.optionList[2].set_options(TextNode.new("Option CA was chosen"), TextNode.new("Option CB was chosen"), TextNode.new("Option CC was chosen"))
	startingNode.optionList[2].set_game_over_status(true, true, true)
	
	status_update.emit()

	
	displayText = startingNode.currentText
	choiceOneNode = startingNode.optionList[0]
	choiceTwoNode = startingNode.optionList[1]
	choiceThreeNode = startingNode.optionList[2]
	
	displayTextLength = displayText.length();

func _process(delta: float) -> void:
	if Input.is_action_pressed("skip"):
		count = displayTextLength + 1
		text = displayText

func _on_timer_timeout() -> void:
	if (count < displayTextLength):
		append_text(displayText[count]);
		count = count + 1
	


func _on_choice_1_pressed() -> void:
	currentNode = currentNode.optionList[0]
	displayText = currentNode.currentText
	if currentNode.gameOver == true:
		game_over.emit()
		displayText = displayText + "\nGame Over!"
	displayTextLength = displayText.length();
	self.text = ""
	count = 0


func _on_choice_2_pressed() -> void:
	currentNode = currentNode.optionList[1]
	displayText = currentNode.currentText
	if currentNode.gameOver == true:
		game_over.emit()
		displayText = displayText + "\nGame Over!"
	displayTextLength = displayText.length();
	self.text = ""
	count = 0


func _on_choice_3_pressed() -> void:
	currentNode = currentNode.optionList[2]
	displayText = currentNode.currentText
	if currentNode.gameOver == true:
		game_over.emit()
		displayText = displayText + "\nGame Over!"
	displayTextLength = displayText.length();
	self.text = ""
	count = 0
