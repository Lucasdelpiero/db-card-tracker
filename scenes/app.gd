extends Control

@onready var saga_selection : SagaSelection = %SagaSelection
@onready var saga_cards : SagaCards = %SagaCards

func _ready() -> void:
	saga_selection.visible = true
	saga_cards.visible = false
	saga_selection.saga_changed.connect(change_saga)

func change_saga(num : int):
	saga_selection.visible = false
	saga_cards.load_data(num)
	saga_cards.visible = true

func _on_box_button_button_pressed() -> void:
	saga_cards.load_data(1)
	saga_selection.visible = false
	saga_cards.visible = true

func _on_card_card_pressed() -> void:
	saga_selection.visible = true
	saga_cards.visible = false

# Vuelve al menu principal
func _on_button_back_pressed() -> void:
	saga_selection.visible = true
	saga_cards.visible = false
