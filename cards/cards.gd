class_name Cards
extends Sprite2D

var atlasTexture: AtlasTexture
var flipState: bool
var value: int
var cardType: CardType
enum CardType {Multiplier,Adder,Bust}
# Called when the node enters the scene tree for the first time.
func _ready():
	texture = atlasTexture.atlas
	pass # Replace with function body.
