extends Node2D
var sequencia = [];
var rng = RandomNumberGenerator.new();
var rodada = 0;
var index = []
var vermelho = 0;
var verde = 1;
var azul = 2;
var amarelo = 3;
var timer = 1;
var flag = 1;

signal over


var TRYAGAIN = preload("res://SFX/Voices/DORA_TRYAGAIN2.wav")
var GREAT = preload("res://SFX/DIEGO_GREAT_1.wav")
var RED = preload("res://SFX/RED.ogg")
var GREEN = preload("res://SFX/GREEN.ogg")
var BLUE = preload("res://SFX/BLUE.ogg")
var YELLOW = preload("res://SFX/YELLOW.ogg")


var G1 = preload("res://assets/geniusGREEN.png")
var G2 = preload("res://assets/geniusGREEN2.png")	
var Y1 = preload("res://assets/geniusYELLOW.png")
var Y2 = preload("res://assets/geniusYELLOW2.png")
var B1 = preload("res://assets/geniusBLUE.png")
var B2 = preload("res://assets/geniusBLUE2.png")
var R1 = preload("res://assets/geniusRED.png")
var R2 = preload("res://assets/geniusRED2.png")
var normalBTN = [R1,G1,B1,Y1]
var pressedBTN = [R2,G2,B2,Y2]

var buttons = [get_node("Node2D/RED"),get_node("Node2D/GREEN"),get_node("Node2D/BLUE"),get_node("Node2D/YELLOW")]
func _ready():
	
	$Node2D/RED.set_disabled(true)
	$Node2D/GREEN.set_disabled(true)
	$Node2D/YELLOW.set_disabled(true)
	$Node2D/BLUE.set_disabled(true)
	$Node2D/roundLVL.text = String(rodada + 1)
	$Node2D/Round.text = "ROUND"
	pass

 
func _physics_process(delta):

	if(rodada == 5):
		$AudioStreamPlayer.stream = preload("res://SFX/kids_cheering_gaming_sound_effect_hd_-4947645024402633994_1.ogg")
		$AudioStreamPlayer.play()
		$AnimationPlayer.play("YOUWIN")
		yield($AnimationPlayer,"animation_finished")
		emit_signal("over")
		rodada = 6	




func _on_GREEN_pressed():
	index.append(verde);
	$AudioStreamPlayer.stream = GREEN
	$AudioStreamPlayer.play()
	yield($AudioStreamPlayer,"finished")
	pass # Replace with function body.
	
func _on_BLUE_pressed():
	index.append(azul);
	$AudioStreamPlayer.stream = BLUE
	$AudioStreamPlayer.play()
	yield($AudioStreamPlayer,"finished")
	pass # Replace with function body.

func _on_RED_pressed():
	index.append(vermelho);
	$AudioStreamPlayer.stream = RED
	$AudioStreamPlayer.play()
	yield($AudioStreamPlayer,"finished")
	pass # Replace with function body.

func _on_YELLOW_pressed():
	index.append(amarelo)
	$AudioStreamPlayer.stream = YELLOW
	$AudioStreamPlayer.play()
	yield($AudioStreamPlayer,"finished")
	pass # Replace with function body.


func _on_PLAY_pressed():
	rng.randomize();
	sequencia.append(rng.randi_range(0, 3))
	flag = 1
	while(rodada < 5):
		for n in range(sequencia.size()):
			if sequencia[n] == 0:
				$Node2D/RED.set_disabled_texture(pressedBTN[sequencia[n]])
				yield(get_tree().create_timer(1), "timeout")
				$Node2D/RED.set_disabled_texture(normalBTN[sequencia[n]])
				if flag == 1:
					$AudioStreamPlayer.stream = RED
					$AudioStreamPlayer.play()
					yield($AudioStreamPlayer,"finished")
				
			if sequencia[n] == 1:
				$Node2D/GREEN.set_disabled_texture(pressedBTN[sequencia[n]])
				yield(get_tree().create_timer(1), "timeout")
				$Node2D/GREEN.set_disabled_texture(normalBTN[sequencia[n]])
				if flag == 1:
					$AudioStreamPlayer.stream = GREEN
					$AudioStreamPlayer.play()
					yield($AudioStreamPlayer,"finished")
				
			if sequencia[n] == 2:
				$Node2D/BLUE.set_disabled_texture(pressedBTN[sequencia[n]])
				yield(get_tree().create_timer(1), "timeout")
				$Node2D/BLUE.set_disabled_texture(normalBTN[sequencia[n]])
				if flag == 1:
					$AudioStreamPlayer.stream = BLUE
					$AudioStreamPlayer.play()
					yield($AudioStreamPlayer,"finished")
				
			if sequencia[n] == 3:
				$Node2D/YELLOW.set_disabled_texture(pressedBTN[sequencia[n]])
				yield(get_tree().create_timer(1), "timeout")
				$Node2D/YELLOW.set_disabled_texture(normalBTN[sequencia[n]])
				if flag == 1:
					$AudioStreamPlayer.stream = YELLOW
					$AudioStreamPlayer.play()
					yield($AudioStreamPlayer,"finished")
				
		yield(get_tree().create_timer(0.5), "timeout")
		flag = 0
				
		$Node2D/RED.set_disabled(false)
		$Node2D/GREEN.set_disabled(false)
		$Node2D/YELLOW.set_disabled(false)
		$Node2D/BLUE.set_disabled(false)
	
	
		if !index.empty():
			if(sequencia[sequencia.size() - 1] != index[index.size()-1]):
				$Node2D/RED.set_disabled(true)
				$Node2D/GREEN.set_disabled(true)
				$Node2D/YELLOW.set_disabled(true)
				$Node2D/BLUE.set_disabled(true)
				Socket.write_text("wrong\n")
				$AudioStreamPlayer.stream = TRYAGAIN
				$AudioStreamPlayer.play()
				yield($AudioStreamPlayer,"finished")
				index = [];
				flag = 1
				continue
		
		
		if(index.size() == sequencia.size()):	
			$Node2D/RED.set_disabled(true)
			$Node2D/GREEN.set_disabled(true)
			$Node2D/YELLOW.set_disabled(true)
			$Node2D/BLUE.set_disabled(true)
			Socket.write_text("right\n")
			$AudioStreamPlayer.stream = GREAT
			$AudioStreamPlayer.play()
			yield($AudioStreamPlayer,"finished")
			rodada += 1
			if rodada < 5:
				$Node2D/roundLVL.text = String(rodada + 1)
			rng.randomize();
			sequencia.append(rng.randi_range(0, 3))	
			flag = 1
			index = [];
			
	pass # Replace with function body.
