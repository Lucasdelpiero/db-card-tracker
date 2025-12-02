extends Resource
class_name CardData

enum VARIANTE {
	default = 0,
	normal = 1,
	glitter = 2,
	bronce = 3,
	dorada = 4,
	plateada = 5,
	rojo = 6,
	verde = 7,
	azul = 8,
	celeste = 9,
	turquesa = 10,
	rosa = 11,
	violeta = 12
}

var numero : int = 0
var tiene : bool = false

var obtenidas : Array[bool] = []
var cantRepetidas : Array[int] = []

func _init() -> void:
	for i in range(13):
		obtenidas.append(false)
		cantRepetidas.append(0)
		print(i)
	for i in range(13):
		print("var %d: obt:%s cant:%d" % [i, obtenidas[i], cantRepetidas[i] ])
