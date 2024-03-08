import random 

colors = ("A", "B", "C", "D")
values = ("1","2","3","4","5","6","7","9","10","J","Q","K")

deck = []
for color in colors:
    for value in values:
      deck.append(color + value)

random.shuffle(deck)

print("Karty:", deck)

print("Karta 1:", deck.pop())
print("Karta 2:", deck.pop())

print("Zbývající karty:", deck)

