extends Node2D

func _process(_delta: float) -> void:
	if $".".visible:
		if Input.is_action_just_pressed("Click"):
			if $IceCreamSheet.visible:
				$IceCreamSheet.hide()
				$bite.play()
			elif $IceCreamSheet2.visible:
				$IceCreamSheet2.hide()
				$bite.play()
			elif $IceCreamSheet3.visible:
				$IceCreamSheet3.hide()
				$bite.play()
			elif $IceCreamSheet4.visible:
				$IceCreamSheet4.hide()
				$bite.play()
			elif $IceCreamSheet4.hidden:
				$"../Scene_transition/Transition".play("Transition")
				$"../River/Ice_cream_enter".queue_free()
				await get_tree().create_timer(0.3).timeout
				$"../CharacterBody2D/CameraPark".enabled = false
				$"../CharacterBody2D/CameraStreet".enabled = true
				$"../CharacterBody2D".global_position = Vector2(-1348, 2313)
				$".".hide()
				get_node("/root/Main/CharacterBody2D").get_node("%ColorRect2").show()
