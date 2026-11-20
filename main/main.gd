extends Node2D

var rolls: int

var lockedrowcolumn: Array[Array]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func calulateEarnings() -> int: 
	var totalEarnings: int = 0
	var multiplier: int = 1
	var newEarnings: int = 0
	var board : Board = get_node("Board")
	for i in range(rolls):
		var row : int = randi_range(0,board.boardDimenstions.x)
		var column : int  = randi_range(0,board.boardDimenstions.y)
		while lockedrowcolumn[0].has(row):
			row = randi_range(0,board.boardDimenstions.x)
		while lockedrowcolumn[1].has(column):
			column = randi_range(0,board.boardDimenstions.y)
		var selectedCards : Array = board.cardsArray.filter(func(n): return (n.position.y / board.boardDimenstions.y) == row || (n.position.x / board.boardDimenstions.x) == column)
		if selectedCards.any(func(n): return n.CardType == Cards.CardType.Bust):
			return -1;
		var multCards : Array = selectedCards.filter(func(n): return n.CardType == Cards.CardType.Multiplier)
		var addCards : Array = selectedCards.filter(func(n): return n.Cards == Cards.CardType.Adder)
		for card in multCards:
			multiplier *= card.value
		for card in addCards:
			newEarnings += card.value
		totalEarnings += newEarnings * multiplier
	return totalEarnings

