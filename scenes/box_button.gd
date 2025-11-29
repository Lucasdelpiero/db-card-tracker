extends MarginContainer
class_name Box

signal saga_selected(num : int)

@onready var texture : TextureRect = %TextureRect
@onready var label : Label = %Label 
var num : int = 0

func _on_button_pressed() -> void:
	saga_selected.emit(num)
