extends Control
class_name SagaCards

const ICONS_PATH = "res://data/icons/" # "res://data/icons/1/"
var card_scene = preload("res://scenes/card.tscn")
@onready var cards_container : GridContainer = %GridContainer
@onready var tittle : Label = %LabelTittleCards

@onready var saga : int = 0

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

func load_data(num : int):
	# Delete all cards
	for child : Card in cards_container.get_children() as Array[Card]:
		child.queue_free()
	saga = num
	
	tittle.text = nombres[num]
	
	var dir_name : String = "%s/%d/" % [ICONS_PATH, num ]
	var dir := DirAccess.open(dir_name)
	if dir == null:
		push_error("No se encuentra el directorio")
		return
	
	dir.list_dir_begin()
	for file: String in dir.get_files():
		if !file.contains(".import"):
			var num_string : String = file.get_slice(".jpg", 0)
			create_card(dir.get_current_dir() + "/" + file, int(num_string))



func create_card(path : String, num : int):
	var image = load(path)
	var new : Card = card_scene.instantiate()
	cards_container.add_child(new)

	new.num = num
	new.texture.set_texture(image)
	new.button.text = "Carta #" + str(num)
	
