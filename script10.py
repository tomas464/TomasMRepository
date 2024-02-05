import random
w, h, mines = 20, 5, 5
# gene empty field
field = [[0 for y in range(h)] for x in range(w)]
# put mine on random position
if mines > w * h:
    mines = 0
    print("Error: Too many mines.")
for i in range(mines):
    while True:
        rx = random.randint(0, w - 1)
        ry = random.randint(0, h - 1)
        if field[rx][ry] != "M":
            field[rx][ry] = "M"
            break
# print field
for y in range(h):
    for x in range(w):
        print(field[x][y], end="")
    print()


for y in range(h):
    for x in range(w):
        if field[x][y] == "M":
            print("mina na [{}, {}]".format(x, y))
