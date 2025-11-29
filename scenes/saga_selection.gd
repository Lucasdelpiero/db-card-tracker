extends Control
class_name SagaSelection

signal saga_changed(num : int)

const BOX_PATH = "res://data/box/" 
var box_scene = preload("res://scenes/box_button.tscn")
@onready var box_container : VBoxContainer = %BoxContainer

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
	for child in box_container.get_children():
		child.queue_free()
	
	for i in range(1, 17):
		load_data(i)
	
	

func load_data(num : int):
	# Delete all cards
	for child : Box in box_container.get_children() as Array[Box]:
		child.queue_free()
	saga = num
	
	var dir_name : String = "%s" % BOX_PATH
	var dir := DirAccess.open(dir_name)
	
	if dir == null:
		push_error("No se encuentra el directorio")
		return
	
	dir.list_dir_begin()
	for file: String in dir.get_files():
		if !file.contains(".import"):
			var num_string : String = file.get_slice(".jpg", 0)
			create_box(dir.get_current_dir() + "/" + file, int(num_string))

func create_box(path : String, num : int):
	var image = load(path)
	var new : Box = box_scene.instantiate()
	box_container.add_child(new)
	
	new.saga_selected.connect(saga_select)
	new.num = num
	new.texture.set_texture(image)
	new.label.text = nombres[num]

func saga_select(num : int):
	saga_changed.emit(num)
	pass
