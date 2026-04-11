extends Node2D

var interact = preload("res://interact.png")

@onready var Light1_ON = $"TileMap/Objects/Light1/Light1-on"
@onready var Light1_OFF = $"TileMap/Objects/Light1/Light1-off"
@onready var Light2_ON = $"TileMap/Objects/Light2/Light2-on"
@onready var Light2_OFF = $"TileMap/Objects/Light2/Light2-off"
@onready var Light3_ON = $"TileMap/Objects/Light3/Light3-on"
@onready var Light3_OFF = $"TileMap/Objects/Light3/Light3-off"


func _ready() -> void:
	pass # Replace with function body.
func _process(delta: float) -> void:
	pass
	
#Change cursor if on interactable thing
func interact_cursor():
	Input.set_custom_mouse_cursor(interact)
#Change cursor if not on interactable thing
func normal_cursor():
	Input.set_custom_mouse_cursor(null)

#Light1
func _on_light_1_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("interact"):
		if Light1_ON.visible: 
			Light1_ON.visible = false
			Light1_OFF.visible = true
		else:
			Light1_ON.visible = true
			Light1_OFF.visible = false
			
func _on_light_2_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("interact"):
		if Light2_ON.visible: 
			Light2_ON.visible = false
			Light2_OFF.visible = true
		else:
			Light2_ON.visible = true
			Light2_OFF.visible = false

func _on_light_3_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("interact"):
		if Light3_ON.visible: 
			Light3_ON.visible = false
			Light3_OFF.visible = true
		else:
			Light3_ON.visible = true
			Light3_OFF.visible = false
