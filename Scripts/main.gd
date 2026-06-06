extends Node2D

@onready var transition: AnimationPlayer = $Scene_transition/Transition

func _ready() -> void:
	$River/activity.interacted.connect(_start_fishing)
	$River/Ice_cream.interacted.connect(_icecream)
	$River/Ice_cream_enter.interacted.connect(_enter_icecream)
	$River/Game_parlour_enter2.interacted.connect(_enter_game)
	$River/Game_activity.interacted.connect(_playgame)
	$River/Beach_activity.interacted.connect(_beach)

func _on_to_park_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		transition.play("Transition")
		await get_tree().create_timer(0.3).timeout
		$CharacterBody2D.global_position = Vector2(-1999, 432)
		$CharacterBody2D/CameraSchool.enabled = false
		$CharacterBody2D/CameraPark.enabled =  true

func _on_park_to_school_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		transition.play("Transition")
		await get_tree().create_timer(0.3).timeout
		$CharacterBody2D.global_position = Vector2(294, 441)
		$CharacterBody2D/CameraSchool.enabled = true
		$CharacterBody2D/CameraPark.enabled = false

func _on_school_to_street_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		transition.play("Transition")
		await get_tree().create_timer(0.3).timeout
		$CharacterBody2D.global_position = Vector2(-1198, 2222)
		$CharacterBody2D/CameraSchool.enabled = false
		$CharacterBody2D/CameraStreet.enabled = true

func _on_street_to_school_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		transition.play("Transition")
		await get_tree().create_timer(0.3).timeout
		$CharacterBody2D.global_position = Vector2(381, 701)
		$CharacterBody2D/CameraSchool.enabled = true
		$CharacterBody2D/CameraStreet.enabled = false

func _on_street_to_river_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		transition.play("Transition")
		await get_tree().create_timer(0.3).timeout
		$CharacterBody2D.global_position = Vector2(-3945, 2313)
		$CharacterBody2D/CameraRiver.enabled = true
		$CharacterBody2D/CameraStreet.enabled = false

func _on_river_to_street_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		transition.play("Transition")
		await get_tree().create_timer(0.3).timeout
		$CharacterBody2D.global_position = Vector2(-1802, 2469)
		$CharacterBody2D/CameraRiver.enabled = false
		$CharacterBody2D/CameraStreet.enabled = true

func _on_school_to_beach_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		transition.play("Transition")
		await get_tree().create_timer(0.3).timeout
		$CharacterBody2D.global_position = Vector2(5302, 2987)
		$CameraBeach.enabled = true
		$CharacterBody2D/CameraSchool.enabled = false

func _on_fishing_activity_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		if Input.is_action_just_pressed("interact"):
			print("interactinge")

func _start_fishing() -> void:
	transition.play("Transition")
	$Fishing_GamePlay.show()
	await get_tree().create_timer(0.3).timeout
	$CharacterBody2D/CameraRiver.enabled = false
	$CharacterBody2D/CameraSchool.enabled = true
	
func _icecream() -> void:
	transition.play("Transition")
	$Ice_Cream_activity.show()
	await get_tree().create_timer(0.3).timeout
	$CharacterBody2D/Camerarooms.enabled = false
	$CharacterBody2D/CameraPark.enabled = true
	
func _enter_icecream() -> void:
	transition.play("Transition")
	$CharacterBody2D.global_position = Vector2(450, 2350)
	await get_tree().create_timer(0.3).timeout
	$CharacterBody2D/CameraStreet.enabled = false
	$CharacterBody2D/Camerarooms.enabled = true
	
func _enter_game() -> void:
	transition.play("Transition")
	$CharacterBody2D.global_position = Vector2(1914, 2247)
	await get_tree().create_timer(0.3).timeout
	$CharacterBody2D/CameraStreet.enabled = false
	$CharacterBody2D/CameraGame.enabled = true

func _playgame() -> void:
	transition.play("Transition")
	await get_tree().create_timer(0.3).timeout
	$CharacterBody2D/CameraGame.enabled = false
	$Ice_Cream_activity/game_camera.enabled = true
	$Game/playing_game.show()

func _on_game_level_com_body_entered(body: Node2D) -> void:
	transition.play("Transition")
	$River/Game_parlour_enter2.queue_free()
	$Game/playing_game/umm.queue_free()
	get_node("/root/Main/CharacterBody2D").get_node("%ColorRect3").show()
	$CharacterBody2D.global_position = Vector2(-1510, 2433)
	await get_tree().create_timer(0.3).timeout
	$CharacterBody2D/CameraStreet.enabled = true
	$Ice_Cream_activity/game_camera.enabled = false
	
func _beach() -> void:
	$AnimationPlayer.play("final")
	$CharacterBody2D.queue_free()
	
