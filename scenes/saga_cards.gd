extends Control
class_name SagaCards

const ICONS_PATH = "res://data/icons/" # "res://data/icons/1/"
var card_scene = preload("res://scenes/card.tscn")
var path_global : String = ""
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

func _ready() -> void:
	for i in range(1,17):
		for file_name in DirAccess.get_files_at(ICONS_PATH + "/" + str(i)):
			if (file_name.get_extension() == "import"):
				file_name = file_name.replace('.import', '')
	
	if OS.has_feature("editor"):
		# Running from an editor binary.
		# `path` will contain the absolute path to `hello.txt` located in the project root.
		path_global = ProjectSettings.globalize_path("res://data/icons/")
	else:
		# Running from an exported project.
		# `path` will contain the absolute path to `hello.txt` next to the executable.
		# This is *not* identical to using `ProjectSettings.globalize_path()` with a `res://` path,
		# but is close enough in spirit.
		path_global = OS.get_executable_path().get_base_dir().path_join("data/icons/")

func load_resource(num: int):
	for child : Card in cards_container.get_children() as Array[Card]:
		child.queue_free()
	saga = num
	tittle.text = nombres[num]
	
	var dir_name : String = ICONS_PATH
	var files = ResourceLoader.list_directory(ICONS_PATH + "/" + str(num))
	for file in files:
		var num_string : String = file.get_slice(".jpg", 0)
		var path = "%s%s/%s" % [ICONS_PATH, str(num), file]
		create_card(path, int(num_string))

func load_data(num : int):
	load_resource(num)
	return
	# TEST
	
	for child : Card in cards_container.get_children() as Array[Card]:
		child.queue_free()
	
	saga = num
	
	tittle.text = nombres[num]
	
	#var dir_name : String = "%s/%d/" % [ICONS_PATH, num ]
	var dir_name : String = "%s/%d/" % [path_global, num ]
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
	new.owner = get_tree().edited_scene_root

	new.num = num
	new.texture.set_texture(image)
	new.button.text = "Carta #" + str(num)
	
