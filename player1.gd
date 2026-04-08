extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const WALK_VELOCITY := 150.0
const ACCELERATION := 0.12
const DECELERATION := 0.12

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.get_axis("Walk_left", "Walk_right"):
		animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("idle")
		
	move_and_slide()
	handle_movement()

func handle_movement() -> void: 
	var input_direction := signf(Input.get_axis("Walk_left","Walk_right"))
	var Speed = WALK_VELOCITY
	
	if input_direction:
		animated_sprite_2d.flip_h = input_direction < 0
		velocity.x = lerp(velocity.x, input_direction * Speed, ACCELERATION)
	else:
		velocity.x = lerp(velocity.x, 0.0, DECELERATION)
