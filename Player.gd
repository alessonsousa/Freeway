extends Area2D

export var speed = 100
var screen_size
signal pontua

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocidade = Vector2()
	if Input.is_action_pressed("ui_down"):
		velocidade.y += 1
	if Input.is_action_pressed("ui_up"):
		velocidade.y -= 1
	if velocidade.length() > 0:
		velocidade = velocidade.normalized() * speed
		$AnimatedSprite.play()
	else: 
		$AnimatedSprite.stop()
	position += velocidade*delta
	#Não sair da tela
	position.y = clamp(position.y,0,screen_size.y)
	# Tocar animações
	if velocidade.y > 0:
		$AnimatedSprite.animation = "baixo"
	elif velocidade.y < 0:
		$AnimatedSprite.animation = "cima"

func _on_Player_body_entered(body):
	if body.name == "ganha":
		emit_signal("pontua")
	else:
		$AudioStreamPlayer2D.play()
	position.x = 320
	position.y = 696
	
func volta():
		position.x = 320
		position.y = 696
