extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const WALK_VELOCITY := 150.0
const ACCELERATION := 0.12
const DECELERATION := 0.12

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if Input.get_axis("Walk_left", "Walk_right"):
		animated_sprite_2d.play("walk")
	elif Input.get_axis("Walk_for", "Walk_back"):
		animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("idle")
		
	move_and_slide()
	handle_movement()

func handle_movement() -> void: 
	var input_vec = Input.get_vector("Walk_left", "Walk_right", "Walk_for", "Walk_back")
	var horizontal_float: float = input_vec.x
	var vertical_float: float = input_vec.y	
	var Speed = WALK_VELOCITY
	
	if input_vec:
		animated_sprite_2d.flip_h = horizontal_float < 0
		velocity.x = lerp(velocity.x, horizontal_float * Speed, ACCELERATION)
		velocity.y = vertical_float * Speed
	else:
		velocity.x = lerp(velocity.x, 0.0, DECELERATION)
