@tool
extends VBoxContainer
class_name Card

signal card_pressed()

@onready var texture = %TextureRect
@onready var button = %Button

@onready var num : int = 0

@onready var data : CardData = CardData.new()

func _on_button_pressed() -> void:
	if data != null:
		print("data: " + str(data.normal))
	card_pressed.emit()
	pass # Replace with function body.
