import copy


def kill(x, a, b):
    chek = 0
    if a > 0:
        if x[a-1][b] == 1:
            chek = 1

    if a < 9:
        if x[a+1][b] == 1:
            chek = 1
    if b > 0:
        if x[a][b-1] == 1:
            chek = 1
    if b < 9:
        if x[a][b+1] == 1:
            chek = 1
    return chek





def shot(x, y, a, b):
    if x[a][b] == 1:
        x[a][b] = -1
        y[a][b] = -1
        kill(copy.deepcopy(x), a, b)
    else:
        x[a][b] = -2
        y[a][b] = -2
    return x, y


pole1_me = [[1, 1, 1, 1, 0, 0, 1, 1, 1],
            [0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 1, 0, 0, 0, 0],
            [1, 0, 1, 0, 1, 0, 0, 0, 0],
            [0, 0, 1, 0, 1, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 1, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 1, 0, 1, 0, 1, 0, 1],
            [0, 0, 0, 0, 0, 0, 0, 0, 0]]

pole1_you = [[0, 0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 0]]

pole1_me, pole1_you = shot(copy.deepcopy(pole1_me), copy.deepcopy(pole1_you.copy()), 0, 0)
print("Поле 1")
for i in range(10):
    print(pole1_me[i])
print("\nПоле 2")
for i in range(10):
    print(pole1_you[i])
