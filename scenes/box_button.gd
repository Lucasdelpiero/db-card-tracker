extends MarginContainer

@onready var touch_button = %TouchScreenButton

signal button_pressed(button : TouchScreenButton)
signal button_released(button : TouchScreenButton)

func _on_touch_screen_button_pressed() -> void:
	button_pressed.emit(touch_button)


func _on_touch_screen_button_released() -> void:
	button_released.emit(touch_button)
