class_name Cards
extends Sprite2D

@onready var animationPlayer : AnimationPlayer = $AnimationPlayer
var flipState: bool
var value: int
var cardType: CardType
enum CardType {Multiplier,Adder,Bust}

func FlipCard(flipType: int):
	match flipType:
		0:
			if !flipState:
				animationPlayer.play("flip")
			pass
		1:
			if !flipState:
				animationPlayer.play("flip")	
				animationPlayer.play_section("flip",0,0.1333)
				flipState = true
				pass
		-1:
			if flipState:
				animationPlayer.play_section("flip",0.1333,0.3)
				flipState = false
	

