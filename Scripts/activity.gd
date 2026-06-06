extends Area2D

signal interacted
var player_nearby: bool = false

func _process(_delta: float) -> void:
	if player_nearby and Input.is_action_just_pressed("interact"):
		$"../../int".play()
		interacted.emit()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		player_nearby = true
		$"../../CharacterBody2D/Interact2".show()

func _on_body_exited(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		player_nearby = false
		$"../../CharacterBody2D/Interact2".hide()
