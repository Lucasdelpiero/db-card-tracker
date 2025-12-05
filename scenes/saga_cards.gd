extends Control
class_name SagaCards

signal sg_send_data_variante_pressed(data : CardData)

const ICONS_PATH = "res://data/icons/" # "res://data/icons/1/"
var card_scene = preload("res://scenes/card.tscn")
var path_global : String = ""
@onready var cards_container : GridContainer = %GridContainer
@onready var tittle : Label = %LabelTittleCards

@onready var saga : int = 0

@onready var cards_data : Array[CardData] = []

var nombres : Array[String] = ["Default",
	"Leyenda 1",
	"Leyenda 2",
	"Leyenda 3",
	"Cartas Ocultas",
	"Leyenda 4",
	"Leyenda 5",
	"Leyenda 6",
	"Especial Personajes",
	"Leyenda 7",
	"Guerreros Legendarios 1",
	"Guerreros Legendarios 2",
	"Super Batalla 1",
	"Super Batalla 2",
	"Especial GT",
	"Batalla Final 1",
	"Batalla Final 2",
	"Extras"
]

func save_data() -> void:
	var data : Dictionary = {}
	data = saveAsJson.load_all_data()
	for card : Card in cards_container.get_children():
			card.data.obtenidas[0] = true
			data[str(card.data.numero)] = [card.data.numero, card.data.obtenidas, card.data.cantRepetidas]
			#print(data[str(card.data.numero)])
	saveAsJson.save_all_data(data)

func load_data(num : int) -> void:
	for child : Card in cards_container.get_children() as Array[Card]:
		child.queue_free()
	saga = num
	tittle.text = nombres[num]
	
	var files = ResourceLoader.list_directory(ICONS_PATH + "/" + str(num))
	for file in files:
		var num_string : String = file.get_slice(".jpg", 0)
		var path = "%s%s/%s" % [ICONS_PATH, str(num), file]
		create_card(path, int(num_string))
	
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
	#new.state_changed.connect(save_data)
	
	return new

func send_data_variant_pressed(data : CardData) -> void:
	sg_send_data_variante_pressed.emit(data)
