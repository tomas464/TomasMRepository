def main():
    numbers = [1, 2, 3, 4, 5]
    total = 0
    for number in numbers:
        if number % 2 == 0:
            total += number
    print(f"Celkový součet sudých čísel v seznamu je {total}.")
if __name__ == "__main__":
    main()
