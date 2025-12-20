extends Control
class_name SagaSelection

signal saga_changed(num : int)

const BOX_PATH = "res://data/box/" 
const TEST = "res://data/icons/008.jpg"
var path_global : String = ""
var box_scene = preload("res://scenes/box_button.tscn")
@onready var box_container : VBoxContainer = %BoxContainer

@onready var saga : int = 0

func _ready() -> void:
	for file_name in DirAccess.get_files_at(BOX_PATH):
		if (file_name.get_extension() == "import"):
			file_name = file_name.replace('.import', '')
	
	if OS.has_feature("editor"):
		# Running from an editor binary.
		# `path` will contain the absolute path to `hello.txt` located in the project root.
		path_global = ProjectSettings.globalize_path("res://data/box/" )
	else:
		# Running from an exported project.
		# `path` will contain the absolute path to `hello.txt` next to the executable.
		# This is *not* identical to using `ProjectSettings.globalize_path()` with a `res://` path,
		# but is close enough in spirit.
		path_global = OS.get_executable_path().get_base_dir().path_join("data/box/" )
	
	for child in box_container.get_children():
		child.queue_free()
	
	for i in range(1, 17):
		load_data(i)


func load_data(num : int):
	for child : Box in box_container.get_children() as Array[Box]:
		child.queue_free()
	saga = num
	
	var files = ResourceLoader.list_directory(BOX_PATH)
	for file in files:
		var num_string : String = file.get_slice(".jpg", 0)
		create_box(BOX_PATH + "/" + file, int(num_string))


func create_box(path : String, num : int):
	var image = load(path)
	#var image = load_asset(path)
	var new : Box = box_scene.instantiate()
	box_container.add_child(new)
	
	new.saga_selected.connect(saga_select)
	new.num = num
	new.texture.set_texture(image)
	new.label.text = Globals.nombres[num]

func saga_select(num : int):
	saga_changed.emit(num)
	pass
