extends HBoxContainer
class_name VariantDetails

signal state_changed()
@export var type : int = 0

enum VARIANTE {
	normal = 0,
	glitter = 1,
	dorada = 2,
	plateada = 3,
	bronce = 4,
	rojo = 5,
	verde = 6,
	azul = 7,
	celeste = 8,
	turquesa = 9,
	rosa = 10,
	violeta = 11
}

var variantes : Array[VARIANTE] = []

signal minus_pressed(type : int)
signal plus_pressed(type : int)
signal check_pressed(type : int, toggled_on: bool)

@onready var check : CheckBox = %CheckBox
@onready var label_amount : Label = %LabelAmount
@onready var label : Label = %Label

func _on_check_box_toggled(toggled_on: bool) -> void:
	check_pressed.emit(type, toggled_on)
	state_changed.emit()

func _on_button_minus_pressed() -> void:
	minus_pressed.emit(type)
	state_changed.emit()

func _on_button_plus_pressed() -> void:
	plus_pressed.emit(type)
	state_changed.emit()

func load_data(obtenida: bool, repetidas: int) -> void:
	label.text = str(VARIANTE.find_key(type)).capitalize()
	check.button_pressed = obtenida
	label_amount.text = str(repetidas)
