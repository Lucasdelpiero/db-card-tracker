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

func get_all_missing() -> String:
	var missing : String = ""
	var temp_saga : String = ""
	var data : Dictionary
	var saga : int = 0
	var has_at_least_one : bool = false
	data = saveAsJson.load_all_data()
	
	for i in range(1, 1800):
		if data.has(str(i)):
			var num : String = str(i)
			if data[num][Globals.cardP.SAGA] != saga:
				if has_at_least_one:
					missing += temp_saga
				#saga = data[num][SAGA]
				saga = data[num][Globals.cardP.SAGA]
				has_at_least_one = false
				temp_saga = ""
			#if data[num][TIENE]:
			if data[num][Globals.cardP.TIENE]:
				has_at_least_one = true
				print(temp_saga)
			else:
				#temp_saga += "%d " % data[num][NUM]
				temp_saga += "%d " % data[num][Globals.cardP.NUM]
	
	missing += temp_saga
	return missing

func get_all_repeated() -> String:
	var repeated : String = ""
	var temp_saga : String = ""
	var data : Dictionary
	data = saveAsJson.load_all_data()
	
	for i in range(1, 1800):
		if data.has(str(i)):
			var num : String = str(i)
			#var tipos : Array = data[num][CANT]
			var tipos : Array = data[num][Globals.cardP.CANT]
			for j in tipos.size():
				if tipos[j] > 0:
					repeated += "%d " % i
					break
	
	repeated += temp_saga
	return repeated

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

func _on_button_copy_all_missing_pressed() -> void:
	print(get_all_missing())
	DisplayServer.clipboard_set(get_all_missing())

func _on_button_copy_all_repeated_pressed() -> void:
	print(get_all_repeated())
	DisplayServer.clipboard_set(get_all_repeated())
