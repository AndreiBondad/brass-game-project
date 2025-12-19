extends RichTextLabel

var testText = "Test Text Test Text Test Text Test Text Test Text"
var testTextLength = testText.length();
var count = 0;

func _ready():
	#add_text("Hello")
	pass

func _printText():
	pass

func _process(delta: float) -> void:
	if Input.is_action_pressed("skip"):
		count = testTextLength + 1
		self.text = testText

func _on_timer_timeout() -> void:
	
	if (count < testTextLength):
		append_text(testText[count]);
		count = count + 1
	
