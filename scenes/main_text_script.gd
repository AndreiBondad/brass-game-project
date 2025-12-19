extends RichTextLabel

var testText = "Test Text"
var testTextLength = testText.length();
var count = 0;

func _ready():
	add_text("Hello")

func _printText():
	pass


func _on_timer_timeout() -> void:
	if (count < testTextLength):
		append_text(testText[count]);
		count = count + 1
	
