extends Node2D

@onready var anim: AnimationPlayer = $fish_clock
@onready var zone: Area2D = $Area2D
var round_active: bool = true
var current_round: int = 1

func _ready() -> void:
	anim.play("round_1")

func _process(_delta: float) -> void:
	if $"..".visible:
		if Input.is_action_just_pressed("Click") and round_active:
			var areas = zone.get_overlapping_areas()
			if areas.size() > 0:
				handle_success()
			else:
				handle_fail()

func handle_success() -> void:
	round_active = false
	if current_round == 1:
		$fish_clock_complete.play("finish1")
		$"../../asd".play()
		$"1st/CollisionPolygon2D".set_deferred("disabled", true)
		$"1st/CollisionPolygon2D2".set_deferred("disabled", false)
		$"round apper".play("round2")
		current_round = 2
		await $"round apper".animation_finished
		round_active = true
	elif current_round == 2:
		$fish_clock_complete.play("finish2")
		$"../../asd".play()
		$"1st/CollisionPolygon2D2".set_deferred("disabled", true)
		$"1st/CollisionPolygon2D3".set_deferred("disabled", false)
		$"round apper".play("round3")
		current_round = 3
		await $"round apper".animation_finished
		round_active = true
	elif current_round == 3:
		$fish_clock_complete.play("finish3")
		$"../../fish".play()
		$"../../asd".play()
		await $fish_clock_complete.animation_finished
		$"../AnimationPlayer".play("Caught_fish")
		await $"../AnimationPlayer".animation_finished
		$"../../Scene_transition/Transition".play("Transition")
		await get_tree().create_timer(0.3).timeout
		$"../../CharacterBody2D/CameraSchool".enabled = false
		$"../../CharacterBody2D/CameraRiver".enabled = true
		$"../../River/activity".queue_free()
		$"..".hide()
		get_node("/root/Main/CharacterBody2D").get_node("%ColorRect4").show()
		$"../../School/walls/CollisionShape2D12".queue_free()
		$"../../School/Fuckyou".hide()

func handle_fail() -> void:
	round_active = false
	$"1st/CollisionPolygon2D".set_deferred("disabled", false)
	$"1st/CollisionPolygon2D2".set_deferred("disabled", true)
	$"1st/CollisionPolygon2D3".set_deferred("disabled", true)
	$"round apper".play("fail")
	$"../AnimationPlayer".play("something")
	current_round = 1
	anim.play("round_1")
	await $"round apper".animation_finished
	round_active = true
