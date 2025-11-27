extends Control

const TIME_PRESS_BUTTON = 0.2

@onready var button_press : TouchScreenButton = null
@onready var button_release : TouchScreenButton = null
@onready var timer_press_button : Timer = %TimerPressButton
@onready var vscroll_start_value : float = 0
@onready var vscroll_end_value : float = 0
var vscroll : VScrollBar = null
@onready var scroll_container_saga : ScrollContainer = %ScrollContainerSaga
@onready var scroll_container_cards : ScrollContainer = %ScrollContainerCards

func _ready() -> void:
	vscroll = scroll_container_saga.get_v_scroll_bar()
	pass

func _on_box_button_button_pressed(button : TouchScreenButton) -> void:
	if button_release == null:
		pass
	if vscroll_start_value == 0.0:
		print("comienza")
		button_press = button
		timer_press_button.start(TIME_PRESS_BUTTON)
		vscroll_start_value = vscroll.value

func _on_box_button_button_released(button: TouchScreenButton) -> void:
	button_release = button
	vscroll_end_value = vscroll.value

func _on_timer_press_button_timeout() -> void:
	print("alf")
	if button_press == button_release and vscroll_start_value == vscroll_end_value:
		print("termina")
		#TODO do stuff when pressed
		button_press = null
		button_release = null
		scroll_container_saga.visible = false
		scroll_container_cards.visible = true
		
	vscroll_start_value = 0.0
	vscroll_end_value = 0.0
	


func _on_card_card_pressed() -> void:
	scroll_container_saga.visible = true
	scroll_container_cards.visible = false
	pass # Replace with function body.
