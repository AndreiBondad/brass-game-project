extends RichTextLabel

var displayText = "Test Text Test Text Test Text Test Text Test Text"
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
	displayText = "Choice 1 was selected"
	displayTextLength = displayText.length();
	self.text = ""
	count = 0
