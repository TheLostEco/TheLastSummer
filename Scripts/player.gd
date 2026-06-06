extends CharacterBody2D

@export var speed: float = 100.0
@export var accel_rate: float = 0.1
var list_open: bool = false
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("list"):
		list_open = !list_open
		if list_open:
			$CanvasLayer/ColorRect/List.show()
			$list.play("list_open")
		else:
			$list.play("list_close")
			await $list.animation_finished
			$CanvasLayer/ColorRect/List.hide()
		
	var input_dir := Input.get_vector("left", "right", "up", "down")
	var iso_dir := Vector2.ZERO
	iso_dir.x = input_dir.x + input_dir.y 
	iso_dir.y = (input_dir.y - input_dir.x) * 0.67 
	var target_velocity = iso_dir * speed
	velocity = velocity.move_toward(target_velocity, speed * accel_rate)
	move_and_slide()
	if input_dir != Vector2.ZERO:
		if animation_player.current_animation != "walk":
			animation_player.play("walk")
			$walk.play()
	else:
		if animation_player.current_animation != "idle":
			animation_player.play("idle")
			$walk.stop()
			
