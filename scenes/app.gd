extends Control


@onready var saga_selection : Control = %SagaSelection
@onready var saga_cards : Control = %SagaCards

func _ready() -> void:
	saga_selection.visible = true
	saga_cards.visible = false

func _on_box_button_button_pressed() -> void:
	saga_selection.visible = false
	saga_cards.visible = true

func _on_card_card_pressed() -> void:
	saga_selection.visible = true
	saga_cards.visible = false

# Vuelve al menu principal
func _on_button_back_pressed() -> void:
	saga_selection.visible = true
	saga_cards.visible = false
