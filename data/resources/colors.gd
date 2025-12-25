extends Resource
class_name Colors

var default_color : Color = Color(1, 0, 1)
@export_group("Box")
@export_color_no_alpha var limitadas : Color = Color(1, 0, 1)
@export_color_no_alpha var naranja : Color = Color(1, 0, 1)
@export_color_no_alpha var azul : Color = Color(1, 0, 1)
@export_color_no_alpha var verde : Color = Color(1, 0, 1)
@export_color_no_alpha var rojo : Color = Color(1, 0, 1)
@export_color_no_alpha var amarillo : Color = Color(1, 0, 1)
@export_color_no_alpha var violeta : Color = Color(1, 0, 1)
@export_color_no_alpha var personajes : Color = Color(1, 0, 1)
@export_color_no_alpha var plateado : Color = Color(1, 0, 1)
@export_color_no_alpha var negro : Color = Color(1, 0, 1)
@export_color_no_alpha var blanco : Color = Color(1, 0, 1)
@export_color_no_alpha var gl_1 : Color = Color(1, 0, 1)
@export_color_no_alpha var gl_2 : Color = Color(1, 0, 1)
@export_color_no_alpha var GT : Color = Color(1, 0, 1)
@export_color_no_alpha var sb_1 : Color = Color(1, 0, 1)
@export_color_no_alpha var sb_2 : Color = Color(1, 0, 1)

@export_group("Variantes")
@export_color_no_alpha var v_normal : Color = Color(1, 0, 1)
@export_color_no_alpha var v_glitter : Color = Color(1, 0, 1)
@export_color_no_alpha var v_dorada : Color = Color(1, 0, 1)
@export_color_no_alpha var v_plateada : Color = Color(1, 0, 1)
@export_color_no_alpha var v_bronce : Color = Color(1, 0, 1)
@export_color_no_alpha var v_rojo : Color = Color(1, 0, 1)
@export_color_no_alpha var v_verde : Color = Color(1, 0, 1)
@export_color_no_alpha var v_azul : Color = Color(1, 0, 1)
@export_color_no_alpha var v_celeste : Color = Color(1, 0, 1)
@export_color_no_alpha var v_turqueza : Color = Color(1, 0, 1)
@export_color_no_alpha var v_rosa : Color = Color(1, 0, 1)
@export_color_no_alpha var v_violeta : Color = Color(1, 0, 1)

var var_colors : Array[Color] = [
	v_normal,
	v_glitter,
	v_dorada,
	v_plateada,
	v_bronce,
	v_rojo,
	v_verde,
	v_azul,
	v_celeste,
	v_turqueza,
	v_rosa,
	v_violeta
]

var name_var_colors : Array[String] = [
	"v_normal",
	"v_glitter",
	"v_dorada",
	"v_plateada",
	"v_bronce",
	"v_rojo",
	"v_verde",
	"v_azul",
	"v_celeste",
	"v_turqueza",
	"v_rosa",
	"v_violeta"
]

var box_colors : Array[Color] = [
	limitadas,
	naranja,
	azul,
	verde,
	rojo,
	amarillo,
	violeta,
	personajes,
	plateado,
	negro,
	blanco,
	gl_1,
	gl_2,
	GT,
	sb_1,
	sb_2
]

var name_box_colors : Array[String] = [
	"limitadas",
	"naranja",
	"azul",
	"verde",
	"rojo",
	"amarillo",
	"violeta",
	"personajes",
	"plateado",
	"negro",
	"blanco",
	"gl_1",
	"gl_2",
	"GT",
	"sb_1",
	"sb_2"
]

func get_box_color(num : int) -> Color:
	var color : Variant = get(name_box_colors[num])
	return color
	
func get_var_color(num: int) -> Color:
	var color : Variant = get(name_var_colors[num])
	return color
