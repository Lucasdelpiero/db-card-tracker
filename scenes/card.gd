@tool
extends VBoxContainer
class_name Card

signal state_changed()
signal variant_pressed(data : CardData)

@onready var texture = %TextureRect
@onready var label = %Label
@onready var button = %Button
@onready var checkbox = %CheckBox

@onready var num : int = 0 :
	set(value):
		data.numero = value

@onready var data : CardData = CardData.new()

func load_data(arg : Array):
	for i in arg[Globals.cardP.OBT].size():
		data.obtenidas[i] = arg[Globals.cardP.OBT][i]
	for i in arg[Globals.cardP.CANT].size():
		data.cantRepetidas[i] = int(arg[Globals.cardP.CANT][i])
	data.tiene = arg[Globals.cardP.TIENE]
	#data.saga = arg[Globals.cardP.SAGA] #BUG NO NECESITA ESTOS
	checkbox.button_pressed = data.tiene

func _on_button_pressed() -> void:
	variant_pressed.emit(data)
	state_changed.emit()

#BUG Using toggled signal call for state changed when setting the initial state  
func _on_check_box_pressed() -> void:
	data.tiene = checkbox.button_pressed
	state_changed.emit()
