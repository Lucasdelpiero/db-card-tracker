extends Control
class_name SagaCards

signal sg_send_data_variante_pressed(data : CardData)

const ICONS_PATH = "res://data/icons/" # "res://data/icons/1/"
var card_scene = preload("res://scenes/card.tscn")
var path_global : String = ""
@onready var cards_container : GridContainer = %GridContainer
@onready var tittle : Label = %LabelTittleCards
@onready var scroll_container : ScrollContainer = %ScrollContainer

@onready var saga : int = 0

@onready var cards_data : Array[CardData] = []

func get_saga_missing(arg_saga : int) -> String:
	var missing : String = ""
	var data : Dictionary
	data = saveAsJson.load_all_data()
	
	for i in range(1, 1800):
		if data.has(str(i)):
			var num : String = str(i)
			if data[num][Globals.cardP.SAGA] == arg_saga and data[num][Globals.cardP.TIENE] == false:
				missing += "%d " % data[num][Globals.cardP.NUM]
	
	return missing

func get_saga_repeated(arg_saga : int) -> String:
	var repeated : String = ""
	var data : Dictionary
	data = saveAsJson.load_all_data()
	
	for i in range(1, 1800):
		if data.has(str(i)):
			var num : String = str(i)
			var tipos : Array = data[num][Globals.cardP.CANT]
			if data[num][Globals.cardP.SAGA] == arg_saga:
				for j in tipos.size():
					if tipos[j] > 0:
						repeated += "%d " % i
						break
	
	return repeated

func save_data() -> void:
	var data : Dictionary = {}
	data = saveAsJson.load_all_data()
	var nums : Array = []
	for card : Card in cards_container.get_children():
		nums.append(card.data.numero)
		data[str(card.data.numero)] = [card.data.numero, saga ,card.data.tiene, card.data.obtenidas, card.data.cantRepetidas]
	saveAsJson.save_all_data(data)

func load_data(num : int) -> void:
	scroll_container.scroll_vertical = 0
	for child : Card in cards_container.get_children() as Array[Card]:
		child.queue_free()
	saga = num
	tittle.text = Globals.nombres[num]
	var nums : Array = []
	var files = ResourceLoader.list_directory(ICONS_PATH + "/" + str(num))

	for file in files:
		var num_string : String = file.get_slice(".jpg", 0)
		#var path = "%s%s/%s" % [ICONS_PATH, str(num), file]
		nums.append(int(num_string))
	nums.sort()
	
	for i in nums:
		var path = "%s%s/%03d.jpg" % [ICONS_PATH, str(saga), i]
		create_card(path, i)
	
	# Carga datos guardados en el dispositivo
	var data := saveAsJson.load_all_data()
	
	for card : Card in cards_container.get_children():
		if card.data.numero != 0 and data.has(str(card.data.numero)):
			card.load_data(data[str(card.data.numero)])

func create_card(path : String, num : int) -> Card:
	var image = load(path)
	var new : Card = card_scene.instantiate()
	cards_container.add_child(new)
	new.owner = get_tree().edited_scene_root

	new.num = num
	new.texture.set_texture(image)
	new.button.text = "Carta #" + str(num)
	new.variant_pressed.connect(send_data_variant_pressed)
	new.state_changed.connect(save_data) # NOTE it was commented
	
	return new

func send_data_variant_pressed(data : CardData) -> void:
	sg_send_data_variante_pressed.emit(data)


func _on_button_missing_pressed() -> void:
	print(get_saga_missing(saga))
	DisplayServer.clipboard_set(get_saga_missing(saga))


func _on_button_rep_pressed() -> void:
	print(get_saga_repeated(saga))
	DisplayServer.clipboard_set(get_saga_repeated(saga))
