@tool
extends VBoxContainer
class_name Card

const NUM = 0
const SAGA = 1
const TIENE = 2
const OBTENIDAS = 3
const CANT = 4

signal state_changed()
signal variant_pressed(data : CardData)

@onready var texture = %TextureRect
@onready var button = %Button
@onready var checkbox = %CheckBox

@onready var num : int = 0 :
	set(value):
		data.numero = value

@onready var data : CardData = CardData.new()

func load_data(arg : Array):
	for i in arg[OBTENIDAS].size():
		data.obtenidas[i] = arg[OBTENIDAS][i]
	for i in arg[CANT].size():
		data.cantRepetidas[i] = int(arg[CANT][i])
	data.tiene = arg[TIENE]
	checkbox.button_pressed = data.tiene

func _on_button_pressed() -> void:
	variant_pressed.emit(data)
	state_changed.emit()

func _on_check_box_toggled(toggled_on: bool) -> void:
	data.tiene = toggled_on
	state_changed.emit()
