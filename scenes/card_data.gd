extends Resource
class_name CardData

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

var numero : int = 0
var tiene : bool = false

var obtenidas : Array[bool] = []
var cantRepetidas : Array[int] = []

func _init() -> void:
	obtenidas.resize(12)
	obtenidas.fill(false)
	cantRepetidas.resize(12)
	cantRepetidas.fill(0)
	#print(VARIANTE.keys()[VARIANTE.normal])
