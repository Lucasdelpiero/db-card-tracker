extends Control

@onready var saga_selection : SagaSelection = %SagaSelection
@onready var saga_cards : SagaCards = %SagaCards
@onready var card_details = %CardDetails

func _ready() -> void:
	get_tree().set_auto_accept_quit(false) # game doesnt close when pressed back
	saga_selection.visible = true
	saga_cards.visible = false
	card_details.visible = false
	saga_selection.saga_changed.connect(change_saga)
	card_details.state_changed.connect(save_data)

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		if card_details.visible:
			card_details.visible = false
			saga_cards.visible = true
			saga_selection.visible = false
			
		elif saga_cards.visible:
				saga_cards.visible = false
				card_details.visible = false
				saga_selection.visible = true
		else:
			get_tree().quit()

func save_data() -> void:
	saga_cards.save_data()

func load_card_details(data : CardData) -> void:
	card_details.visible = true
	card_details.load_data(data)

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
