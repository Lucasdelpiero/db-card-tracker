extends Control
class_name CardDetails

signal state_changed

@onready var saga_cards : SagaCards = %SagaCards

@onready var normal : HBoxContainer = %Normal
@onready var glitter : HBoxContainer = %Glitter
@onready var dorada : HBoxContainer = %Dorada
@onready var plateada : HBoxContainer = %Plateada
@onready var bronce : HBoxContainer = %Bronce
@onready var rojo : HBoxContainer = %Rojo
@onready var verde : HBoxContainer = %Verde
@onready var azul : HBoxContainer = %Azul
@onready var celeste : HBoxContainer = %Celeste
@onready var turquesa : HBoxContainer = %Turquesa
@onready var rosa : HBoxContainer = %Rosa
@onready var violeta : HBoxContainer = %Violeta

@onready var type_container : VBoxContainer = %TypeContainer

@onready var label_numero : Label = %LabelNumero

var data_to_modify : CardData = null
var numero : int = 0
var tipos : Array[VariantDetails] = []

func _ready() -> void:
	var cont : int = 0
	for child : VariantDetails in type_container.get_children() as Array[VariantDetails]:
		tipos.append(child)
		child.plus_pressed.connect(increase_rep)
		child.minus_pressed.connect(decrease_rep)
		child.check_pressed.connect(toggled)
		child.state_changed.connect(update_saga_cards_amount)
		child.change_color(cont)
		cont += 1
	
		

func update_saga_cards_amount() -> void:
	saga_cards.update_amount_cards()

func toggled(type : int, toggled_on : bool) -> void:
	if data_to_modify != null:
		data_to_modify.obtenidas[type] = toggled_on
		load_data(data_to_modify)
		state_changed.emit()

func increase_rep(type : int) -> void:
	if data_to_modify != null:
		data_to_modify.cantRepetidas[type] += 1
		if data_to_modify.cantRepetidas[type] > 0:
			data_to_modify.obtenidas[type] = true
		load_data(data_to_modify)
		state_changed.emit()
	
func decrease_rep(type : int) -> void:
	if data_to_modify != null and data_to_modify.cantRepetidas[type] > 0:
		data_to_modify.cantRepetidas[type] -= 1
		load_data(data_to_modify)
		state_changed.emit()

func load_data(data : CardData) -> void:
	numero = data.numero
	data_to_modify = data
	label_numero.text = "Carta #%d" % data.numero
	if data.numero >= Globals.DUP_PADDING and data.numero < Globals.UNIQUE_PADDING:
		label_numero.text = "F#%d" % (data.numero - Globals.DUP_PADDING)
	elif data.numero >= Globals.UNIQUE_PADDING:
		label_numero.text = "Edicion Limitada #%d" % (data.numero - Globals.UNIQUE_PADDING)
	for i in tipos.size():
		tipos[i].load_data(data.obtenidas[i], data.cantRepetidas[i])


func _on_button_back_pressed() -> void:
	visible = false
	data_to_modify = null
