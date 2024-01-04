def triangle_1(h):


    for i in range(1, h + 1):
        print("    " * (h - i), end="")
        print("000 " * (i * 2 - 1))


triangle_1(7)

