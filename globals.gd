extends Node

# Padding para cartas duplicadas o unicas que se suma al valor de su num
# Para que no se pise con las cartas normales
const DUP_PADDING = 5000
const UNIQUE_PADDING = 6000

const CANT_VAR = 12 # Cantidad de variantes distintas

enum cardP {
	NUM = 0,
	SAGA = 1,
	TIENE = 2,
	OBT = 3,
	CANT = 4
}

var nombres : Array[String] = ["Edicion Limitada",
	"Leyenda 1",
	"Leyenda 2",
	"Leyenda 3",
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

var nums : Array[String] = [
	"",
	"1-129",
	"130-265",
	"266-401",
	"402-543",
	"544-679",
	"680-815",
	"816-951",
	"952-1087",
	"1088-1223",
	"1224-1359",
	"1360-1495",
	"1496-1631",
	"1632-1760",
	"1761-1848",
	"1849-1936"
]
