extends VBoxContainer

signal card_pressed()

func _on_button_pressed() -> void:
	card_pressed.emit()
	pass # Replace with function body.
