y = 0
x = int(input("Digite um valor: "))
while(x != 0):
    if(x % 2 == 0):
        y = y + x
    x = x - 1
print("A soma dos valores pares é: " ,y)