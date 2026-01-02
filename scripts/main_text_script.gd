extends RichTextLabel

class TextNode:
	var currentText = "This is the opening text"
	var choiceText = ""
	var gameOver = false
	var optionList = ["", "", "", "", ""]
	var statuses = ["Alive", "Alive", "Alive", "Alive"]
	var isConversationNode = false

	func _init(nodeText) -> void:
		currentText = nodeText

	func set_options(optionA, optionB, optionC) -> void:
		optionList[0] = optionA
		optionList[1] = optionB
		optionList[2] = optionC

	func set_conversation_options(optionA, optionB, optionC, optionD, optionE) -> void:
		optionList[0] = optionA
		optionList[1] = optionB
		optionList[2] = optionC
		optionList[3] = optionD
		optionList[4] = optionE

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
	var conversationNodeHub = TextNode.new("Conversation Node Hub")
	conversationNodeHub.set_choice_text("Back")
	conversationNodeHub.isConversationNode = true
	
	var cortezConversationNode = TextNode.new("Cortez Conversation Node Hub")
	cortezConversationNode.set_choice_text("Cortez Conversation Node")
	cortezConversationNode.isConversationNode = true
	var cortezNodeA = TextNode.new("Cortez Conversation Node A")
	cortezNodeA.set_choice_text("Cortez Conversation Node A")
	cortezNodeA.isConversationNode = true
	var cortezNodeB = TextNode.new("Cortez Conversation Node B")
	cortezNodeB.set_choice_text("Cortez Conversation Node B")
	cortezNodeB.isConversationNode = true
	var cortezNodeC = TextNode.new("Cortez Conversation Node C")
	cortezNodeC.set_choice_text("Cortez Conversation Node C")
	cortezNodeC.isConversationNode = true
	var cortezNodeD = TextNode.new("Cortez Conversation Node D")
	cortezNodeD.set_choice_text("Cortez Conversation Node D") 
	cortezNodeD.isConversationNode = true
	cortezConversationNode.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)
	cortezNodeA.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)
	cortezNodeB.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)
	cortezNodeC.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)
	cortezNodeD.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)

	var jensenConversationNode = TextNode.new("Jensen Conversation Node Hub")
	jensenConversationNode.set_choice_text("Jensen Conversation Node")
	jensenConversationNode.isConversationNode = true
	var jensenNodeA = TextNode.new("Jensen Conversation Node A")
	jensenNodeA.set_choice_text("Jensen Conversation Node A")
	jensenNodeA.isConversationNode = true
	var jensenNodeB = TextNode.new("Jensen Conversation Node B")
	jensenNodeB.set_choice_text("Jensen Conversation Node B")
	jensenNodeB.isConversationNode = true
	var jensenNodeC = TextNode.new("Jensen Conversation Node C")
	jensenNodeC.set_choice_text("Jensen Conversation Node C")
	jensenNodeC.isConversationNode = true
	var jensenNodeD = TextNode.new("Jensen Conversation Node D")
	jensenNodeD.set_choice_text("Jensen Conversation Node D")
	jensenNodeD.isConversationNode = true
	jensenConversationNode.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)
	jensenNodeA.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)
	jensenNodeB.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)
	jensenNodeC.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)
	jensenNodeD.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)

	var petrovConversationNode = TextNode.new("Petrov Conversation Node Hub")
	petrovConversationNode.set_choice_text("Petrov Conversation Node")
	petrovConversationNode.isConversationNode = true
	var petrovNodeA = TextNode.new("Petrov Conversation Node A")
	petrovNodeA.set_choice_text("Petrov Conversation Node A")
	petrovNodeA.isConversationNode = true
	var petrovNodeB = TextNode.new("Petrov Conversation Node B")
	petrovNodeB.set_choice_text("Petrov Conversation Node B")
	petrovNodeB.isConversationNode = true
	var petrovNodeC = TextNode.new("Petrov Conversation Node C")
	petrovNodeC.set_choice_text("Petrov Conversation Node C")
	petrovNodeC.isConversationNode = true
	var petrovNodeD = TextNode.new("Petrov Conversation Node D")
	petrovNodeD.set_choice_text("Petrov Conversation Node D")
	petrovNodeD.isConversationNode = true
	petrovConversationNode.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)
	petrovNodeA.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)
	petrovNodeB.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)
	petrovNodeC.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)
	petrovNodeD.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)

	var wuConversationNode = TextNode.new("Wu Conversation Node Hub")
	wuConversationNode.set_choice_text("Wu Conversation Node")
	wuConversationNode.isConversationNode = true
	var wuNodeA = TextNode.new("Wu Conversation Node A")
	wuNodeA.set_choice_text("Wu Conversation Node A")
	wuNodeA.isConversationNode = true
	var wuNodeB = TextNode.new("Wu Conversation Node B")
	wuNodeB.set_choice_text("Wu Conversation Node B")
	wuNodeB.isConversationNode = true
	var wuNodeC = TextNode.new("Wu Conversation Node C")
	wuNodeC.set_choice_text("Wu Conversation Node C")
	wuNodeC.isConversationNode = true
	var wuNodeD = TextNode.new("Wu Conversation Node D")
	wuNodeD.set_choice_text("Wu Conversation Node D")
	wuNodeD.isConversationNode = true
	wuConversationNode.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)
	wuNodeA.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)
	wuNodeB.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)
	wuNodeC.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)
	wuNodeD.set_conversation_options(cortezNodeA, cortezNodeB, cortezNodeC, cortezNodeD, conversationNodeHub)

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
	nodeB.set_choice_text("OpionB")
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
	nodeC.set_choice_text("OpionC")
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
	startingNode.choiceText = "Start mission"
	startingNode.set_options(nodeA, nodeB, nodeC)
	
	conversationNodeHub.set_conversation_options(cortezConversationNode, jensenConversationNode, petrovConversationNode, wuConversationNode, startingNode)
	nodeA.set_options(nodeAA, nodeAB, nodeAC)
	nodeB.set_options(nodeBA, nodeBB, nodeBC)
	nodeC.set_options(nodeCA, nodeCB, nodeCC)
	nodeA.set_game_over_status(true, true, true)
	nodeB.set_game_over_status(true, true, true)
	nodeC.set_game_over_status(true, true, true)
	
	currentNode = conversationNodeHub
	
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
	if currentNode.gameOver == false:
		choice_text_update.emit()
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
	if currentNode.gameOver == false:
		choice_text_update.emit()
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
	if currentNode.gameOver == false:
		choice_text_update.emit()
	if currentNode.gameOver == true:
		game_over.emit()
		displayText = displayText + "\nGame Over!"
	displayTextLength = displayText.length();
	self.text = ""
	count = 0
