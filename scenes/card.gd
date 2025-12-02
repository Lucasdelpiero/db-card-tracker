@tool
extends VBoxContainer
class_name Card

const NUM = 0
const OBTENIDAS = 1
const CANT = 2

signal card_pressed()
signal state_changed()

@onready var texture = %TextureRect
@onready var button = %Button

@onready var num : int = 0 :
	set(value):
		data.numero = value

@onready var data : CardData = CardData.new()

func load_data(arg : Array):
	for i in arg[OBTENIDAS].size():
		data.obtenidas[i] = arg[OBTENIDAS][i]
	for i in arg[CANT].size():
		data.cantRepetidas[i] = int(arg[CANT][i])

func _on_button_pressed() -> void:
	card_pressed.emit()
	state_changed.emit()
