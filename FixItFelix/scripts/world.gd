extends Node2D

onready var errorNotification = preload("res://assets/Notifications/error.tscn")
var value = 0
var test = 0
func _ready():
	$Felix.play("world 1")
	yield($Felix,"animation_finished")
	$Camera2D.position.y = 298.264
	$Felix.play("scenesopen transition")
	$Moldura/AnimatedSprite.play("none")
	$AnimationPlayer.play("intro")
	yield($Felix,"animation_finished")
	$CanvasLayer.scale.y = -1
	$CanvasLayer.scale.x = -1
	$AudioStreamPlayer.stream = preload("res://instances/club_penguin_pizza_parlor_theme_charlie_s_here_full_hq_-322452822334571949.ogg")
	$AudioStreamPlayer.volume_db = 0 
	$AudioStreamPlayer.play()
	
	
	pass

func _on_key_correct_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed() && test == 1:
			value = value + 1
			$Door/AnimatedSprite.play("Door_Red_Opening")
			if value == 1:
				yield(get_tree().create_timer(0.9), "timeout")
				$ColorRect.set_position(Vector2(-1050,0))
				$key_correct.set_position(Vector2(850, 519))
				$key_False.set_position(Vector2(169, 519))
				Socket.write_text("right\n")
				$key_False/AnimatedSprite.play("blue")
				$Door/AnimatedSprite.play("Door_Green_Closed")
				$key_correct/AnimatedSprite.play("green")
				
			if value == 2:
				$Door/AnimatedSprite.play("Door_Green_Open")
				yield(get_tree().create_timer(0.9), "timeout")
				$key_correct.set_position(Vector2(850, 519))
				$key_False.set_position(Vector2(169, 519))
				Socket.write_text("right\n")
				$key_False/AnimatedSprite.play("red")
				$Door/AnimatedSprite.play("Door_Blue_Closed")
				$key_correct/AnimatedSprite.play("blue")
				
			if value == 3:
				$Door/AnimatedSprite.play("Door_Blue_Open")
				yield(get_tree().create_timer(0.9), "timeout")
				$Moldura/AnimatedSprite.play("circle")
				$key_correct.set_position(Vector2(169, 519))
				$key_False.set_position(Vector2(850, 519))
				Socket.write_text("right\n")
				$key_False/AnimatedSprite.play("triangle")
				$Door/AnimatedSprite.play("Door_Red_Closed")
				$key_correct/AnimatedSprite.play("circle")
			if value == 4:
				$Door/AnimatedSprite.play("Door_Red_Opening")
				yield(get_tree().create_timer(0.9), "timeout")
				$Moldura/AnimatedSprite.play("squad")
				$key_correct.set_position(Vector2(169, 519))
				$key_False.set_position(Vector2(850, 519))
				Socket.write_text("right\n")
				$key_False/AnimatedSprite.play("circle")
				$Door/AnimatedSprite.play("Door_Red_Closed")
				$key_correct/AnimatedSprite.play("redSquad")
			if value == 5:
				$Door/AnimatedSprite.play("Door_Red_Opening")
				yield(get_tree().create_timer(0.9), "timeout")
				$Moldura/AnimatedSprite.play("greenTriangle")
				$key_correct.set_position(Vector2(169, 519))
				$key_False.set_position(Vector2(850, 519))
				Socket.write_text("right\n")
				$key_False/AnimatedSprite.play("blueCircle")
				$Door/AnimatedSprite.play("Door_Green_Closed")
				$key_correct/AnimatedSprite.play("greenTriangle")
			if value == 6:
				$Door/AnimatedSprite.play("Door_Green_Open")
				yield(get_tree().create_timer(0.9), "timeout")
				$Moldura/AnimatedSprite.play("blueCircle")
				$key_correct.set_position(Vector2(850, 519))
				$key_False.set_position(Vector2(169, 519))
				Socket.write_text("right\n")
				$key_False/AnimatedSprite.play("circle")
				$Door/AnimatedSprite.play("Door_Blue_Closed")
				$key_correct/AnimatedSprite.play("blueCircle")
				
			if value == 7:
				$Door/AnimatedSprite.play("Door_Blue_Open")
				yield(get_tree().create_timer(0.9), "timeout")
				Socket.write_text("right\n")
				$Door/AnimatedSprite.stop()
				$AnimationPlayer2.play("zoom")
				yield($AnimationPlayer2,"animation_finished")
				$CanvasLayer.scale.y = 1
				$CanvasLayer.scale.x = 1
				$Felix.play("world 2")
				yield($Felix,"animation_finished")
				get_tree().change_scene("res://instances/you_win.tscn")
								
	pass # Replace with function body.


func _on_key_False_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			Socket.write_text("wrong\n")
			var noti = errorNotification.instance()
			noti.position = $Position2D.global_position
			get_parent().add_child(noti)
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	test = 1
	pass # Replace with function body.
