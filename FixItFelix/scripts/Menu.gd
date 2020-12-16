extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$AnimationPlayer.play("menu")
	Socket.connect_to_server()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Button3_pressed():
	$CanvasLayer/ColorRect.visible = true
	$AnimationPlayer.stop()
	$AnimationPlayer.play("transition")
	yield($AnimationPlayer,"animation_finished")
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://scenes/Tabuleiro.tscn")
	

func _on_Button2_pressed():
	get_tree().quit()
	
