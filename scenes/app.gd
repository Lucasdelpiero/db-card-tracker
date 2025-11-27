extends Control

@onready var scroll_container_saga : ScrollContainer = %ScrollContainerSaga
@onready var scroll_container_cards : ScrollContainer = %ScrollContainerCards

func _ready() -> void:
	scroll_container_saga.visible = true
	scroll_container_cards.visible = false

func _on_box_button_button_pressed() -> void:
	scroll_container_saga.visible = false
	scroll_container_cards.visible = true

func _on_card_card_pressed() -> void:
	scroll_container_saga.visible = true
	scroll_container_cards.visible = false
