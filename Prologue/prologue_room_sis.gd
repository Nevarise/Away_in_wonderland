extends Node2D

var interact = preload("res://interact.png")

@onready var Cb_open = $"TileMap/Objects/Cabinet/Cb_open"
@onready var Cb_closed = $"TileMap/Objects/Cabinet/Cb_closed"
@onready var ST_open = $"TileMap/Objects/Sidetable/ST_open"
@onready var ST_closed = $"TileMap/Objects/Sidetable/ST_closed"
@onready var L_on = $"TileMap/Objects/Lamp/L_on"
@onready var L_off = $"TileMap/Objects/Lamp/L_off"

func _ready() -> void:
	pass 
func _process(delta: float) -> void:
	pass

#Change cursor if on interactable thing
func interact_cursor():
	Input.set_custom_mouse_cursor(interact)
#Change cursor if not on interactable thing
func normal_cursor():
	Input.set_custom_mouse_cursor(null)


func _on_cb_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("interact"):
		if Cb_open.visible: 
			Cb_open.visible = false
			Cb_closed.visible = true
		else:
			Cb_open.visible = true
			Cb_closed.visible = false

func _on_st_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("interact"):
		if ST_open.visible: 
			ST_open.visible = false
			ST_closed.visible = true
		else:
			ST_open.visible = true
			ST_closed.visible = false

func _on_l_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("interact"):
		if L_on.visible: 
			L_on.visible = false
			L_off.visible = true
		else:
			L_on.visible = true
			L_off.visible = false
