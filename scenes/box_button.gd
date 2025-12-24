extends MarginContainer
class_name Box

signal saga_selected(num : int)

@onready var texture : TextureRect = %TextureRect
@onready var label : Label = %Label 
@onready var button : Button = %ButtonBase
var num : int = 0

	

func _on_button_pressed() -> void:
	saga_selected.emit(num)

func change_color(color : Color) -> void:
	var normal : StyleBoxFlat = button.get("theme_override_styles/normal")
	var new = normal.duplicate(true)
	button.set("theme_override_styles/normal", new)
	new.bg_color = color
	
	var pressed : StyleBoxFlat = button.get("theme_override_styles/pressed")
	new = pressed.duplicate(true)
	button.set("theme_override_styles/pressed", new)
	new.bg_color = color
	
	var hover : StyleBoxFlat = button.get("theme_override_styles/hover")
	new = hover.duplicate(true)
	button.set("theme_override_styles/hover", new)
	new.bg_color = color
