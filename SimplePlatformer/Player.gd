extends KinematicBody2D

var speed : int = 200
var jumpForce : int = 600
var gravity : int = 800
var velocity : Vector2 = Vector2()

onready var sprite : Sprite = get_node("Sprite")

func _physics_process(delta):
	velocity.x = 0
	
	# movement inputs
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	elif Input.is_action_pressed("move_right"):
		velocity.x += speed
		
	# apply velocity
	velocity = move_and_slide(velocity, Vector2.UP)
	
	# gravity
	velocity.y += gravity * delta
	
	# jump input
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= jumpForce
	
	# sprite look direction
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
