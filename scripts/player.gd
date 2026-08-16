extends CharacterBody2D
@onready var Anim: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 80.0
const JUMP_VELOCITY = -300.0

class Submergido:
	static var submergido = false
	static var acabouDeSubmerger = false
	static var acabouDeSair = false
	
	static func submerger():
		submergido = true
		acabouDeSubmerger = true
		acabouDeSair = false
	
	static func sair():
		submergido = false
		acabouDeSubmerger = false
		acabouDeSair = true
	
	static func acabou_de_submerger():
		var a = acabouDeSubmerger
		acabouDeSubmerger = false
		return a
		
	static func acabou_de_sair():
		var a = acabouDeSair
		acabouDeSair = false
		return a
	
	static func esta_submergido():
		return submergido

func _physics_process(delta: float) -> void:
	# Add the gravity.
	var on_floor = is_on_floor()
	if not on_floor:
		if Submergido.esta_submergido():
			velocity += (get_gravity() * delta) * 0.2
			if Submergido.acabou_de_submerger():
				velocity.y = 0
		else: velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and not Submergido.esta_submergido():
		on_floor = false
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_pressed("ui_accept"):
		if Submergido.esta_submergido():
			on_floor = false
			velocity.y = JUMP_VELOCITY * 0.4
		elif Submergido.acabou_de_sair():
			velocity.y = JUMP_VELOCITY


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if Submergido.esta_submergido(): Anim.play("swimming")
		elif on_floor: Anim.play("running")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if on_floor:
			if Submergido.esta_submergido(): Anim.play("idle_submerged")
			else: Anim.play("idle")
	
	if direction > 0: Anim.flip_h = false;
	elif direction < 0: Anim.flip_h = true;
	if velocity.y != 0 and Submergido.esta_submergido(): Anim.play("swimming")
	else:
		if velocity.y > 0: Anim.play("fall")
		elif velocity.y < 0: Anim.play("jumping")
	
	
	move_and_slide()
