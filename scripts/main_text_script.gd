extends RichTextLabel

class TextNode:
	var currentText = "This is the opening text"
	var choiceText = ""
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

	func set_choice_text(text):
		choiceText = text

signal game_over
signal status_update
signal choice_text_update

var startingNode
var currentNode
var displayText
var choiceOneNode
var choiceTwoNode
var choiceThreeNode
var displayTextLength
var count = 0;

func _ready():
	var nodeA = TextNode.new("Option A was chosen")
	nodeA.set_choice_text("OpionA")
	var nodeAA = TextNode.new("Option AA was chosen")
	nodeAA.set_choice_text("OpionAA")
	nodeAA.set_soldier_statuses("Deceased", "Deceased", "Deceased", "Deceased")
	var nodeAB = TextNode.new("Option AB was chosen")
	nodeAB.set_choice_text("OpionAB")
	nodeAB.set_soldier_statuses("Deceased", "Deceased", "Deceased", "Deceased")
	var nodeAC = TextNode.new("Option AC was chosen")
	nodeAC.set_choice_text("OpionAC")
	nodeAC.set_soldier_statuses("Deceased", "Deceased", "Deceased", "Deceased")



	var nodeB = TextNode.new("Option B was chosen")
	var nodeBA = TextNode.new("Option BA was chosen")
	nodeBA.set_choice_text("OpionBA")
	nodeBA.set_soldier_statuses("Deceased", "Deceased", "Deceased", "Deceased")
	var nodeBB = TextNode.new("Option BB was chosen")
	nodeBB.set_choice_text("OpionBB")
	nodeBB.set_soldier_statuses("Deceased", "Deceased", "Deceased", "Deceased")
	var nodeBC = TextNode.new("Option BC was chosen")
	nodeBC.set_choice_text("OpionBB")
	nodeBC.set_soldier_statuses("Deceased", "Deceased", "Deceased", "Deceased")



	var nodeC = TextNode.new("Option C was chosen")
	var nodeCA = TextNode.new("Option CA was chosen")
	nodeCA.set_choice_text("OpionCA")
	nodeCA.set_soldier_statuses("Deceased", "Deceased", "Deceased", "Deceased")
	var nodeCB = TextNode.new("Option CB was chosen")
	nodeCB.set_choice_text("OpionCB")
	nodeCB.set_soldier_statuses("Deceased", "Deceased", "Deceased", "Deceased")
	var nodeCC = TextNode.new("Option CC was chosen")
	nodeCC.set_choice_text("OpionCC")
	nodeCC.set_soldier_statuses("Deceased", "Deceased", "Deceased", "Deceased")

	startingNode = TextNode.new("This is the opening text")
	currentNode = startingNode
	startingNode.set_options(nodeA, nodeB, nodeC)
	
	nodeA.set_options(nodeAA, nodeAB, nodeAC)
	nodeB.set_options(nodeBA, nodeBB, nodeBC)
	nodeC.set_options(nodeCA, nodeCB, nodeCC)
	nodeA.set_game_over_status(true, true, true)
	nodeB.set_game_over_status(true, true, true)
	nodeC.set_game_over_status(true, true, true)
	
	status_update.emit()
	choice_text_update.emit()
	
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
	status_update.emit()
	if currentNode.gameOver == true:
		game_over.emit()
		displayText = displayText + "\nGame Over!"
	displayTextLength = displayText.length();
	self.text = ""
	count = 0

func _on_choice_2_pressed() -> void:
	currentNode = currentNode.optionList[1]
	displayText = currentNode.currentText
	status_update.emit()
	if currentNode.gameOver == true:
		game_over.emit()
		displayText = displayText + "\nGame Over!"
	displayTextLength = displayText.length();
	self.text = ""
	count = 0

func _on_choice_3_pressed() -> void:
	currentNode = currentNode.optionList[2]
	displayText = currentNode.currentText
	status_update.emit()
	if currentNode.gameOver == true:
		game_over.emit()
		displayText = displayText + "\nGame Over!"
	displayTextLength = displayText.length();
	self.text = ""
	count = 0
