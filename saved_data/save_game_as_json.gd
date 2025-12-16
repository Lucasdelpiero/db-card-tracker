extends Resource
class_name saveAsJson

const SAVE_GAME_PATH_RES := "res://saved_data/save.json"  #"user://save.json" 
const SAVE_GAME_PATH_USER := "user://save.json"  #"user://save.json" 
const NUM = 0
const SAGA = 1
const TIENE = 2
const OBTENIDAS = 3
const CANT = 4

static func save_all_data(data : Dictionary):
	#print("SAVING THE GAME")
	var save_game_path : String
	if OS.has_feature("standalone"):
		save_game_path = SAVE_GAME_PATH_USER
	else:
		save_game_path = SAVE_GAME_PATH_RES
	var save_file := FileAccess.open(save_game_path, FileAccess.WRITE)
	for val in data:
		var json_string := JSON.stringify(data[str(val)])
		save_file.store_line(json_string)

static func load_all_data() -> Dictionary:
	var save_game_path : String
	if OS.has_feature("standalone"):
		save_game_path = SAVE_GAME_PATH_USER
	else:
		save_game_path = SAVE_GAME_PATH_RES
	if not FileAccess.file_exists(save_game_path):
		push_error("No existe archivo de guardado")
		return {}# Error! We don't have a save to load.
	#print("LOADING THE GAME")
	var data : Dictionary = {}
	var save_file = FileAccess.open(save_game_path, FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()
		# Creates the helper class to interact with JSON.
		var json = JSON.new()
		# Check if there is any error while parsing the JSON string, skip in case of failure.
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue
		
		# Get the data from the JSON object.
		var temp_obt : Array[int]= []
		for value in json.data[CANT]:
			temp_obt.append(int(value))
		data[str(int(json.data[NUM]))] = [int(json.data[NUM]), int(json.data[SAGA]), json.data[TIENE], json.data[OBTENIDAS], temp_obt]
	
	return data
