extends RichTextLabel

var startingNode = TextNode.new()

var displayText = startingNode.currentText
var choiceOneText = startingNode.optionA
var choiceTwoText = startingNode.optionB
var choiceThreeText = startingNode.optionC
var displayTextLength = displayText.length();
var count = 0;

func _ready():
	#add_text("Hello")
	pass

func _printText():
	pass

func _process(delta: float) -> void:
	if Input.is_action_pressed("skip"):
		count = displayTextLength + 1
		self.text = displayText

func _on_timer_timeout() -> void:
	
	if (count < displayTextLength):
		append_text(displayText[count]);
		count = count + 1
	


func _on_choice_1_pressed() -> void:
	displayText = choiceOneText
	displayTextLength = displayText.length();
	self.text = ""
	count = 0


func _on_choice_2_pressed() -> void:
	displayText = choiceTwoText
	displayTextLength = displayText.length();
	self.text = ""
	count = 0


func _on_choice_3_pressed() -> void:
	displayText = choiceThreeText
	displayTextLength = displayText.length();
	self.text = ""
	count = 0
