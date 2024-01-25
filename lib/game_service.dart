class GameService {
  static List<List<List<int>>> shot(
      List<List<int>> x, List<List<int>> y, int a, int b) {
    List<List<int>> xx = [];
    List<List<int>> yy = [];
    for (int i = 0; i < 10; i++) {
      List<int> be1 = [];
      List<int> be2 = [];
      for (int j = 0; j < 10; j++) {
        be1.add(x[i][j]);
        be2.add(y[i][j]);
      }
      xx.add(be1);
      yy.add(be2);
    }
    if ((x[a][b] == 1)) {
      xx[a][b] = -1;
      yy[a][b] = -1;
      List<List<int>> xxx = [];
      for (int i = 0; i < 10; i++) {
        List<int> be = [];
        for (int j = 0; j < 10; j++) {
          be.add(xx[i][j]);
        }
        xxx.add(be);
      }
      if (_killChek(xxx, a, b) == 0) {
        _kill(xx, a, b);
        _kill(yy, a, b);
      }
    } else if ((x[a][b] != -1) && (x[a][b] != -2)) {
      xx[a][b] = -3;
      yy[a][b] = -3;
    }
    return [xx, yy];
  }

  static int _killChek(List<List<int>> xxx, int a, int b) {
    xxx[a][b] = -2;
    if (a > 0) {
      if (xxx[a - 1][b] == 1) {
        return 1;
      }
      if (xxx[a - 1][b] == -1) {
        if (_killChek(xxx, a - 1, b) == 1) {
          return 1;
        }
      }
    }
    if (a < 9) {
      if (xxx[a + 1][b] == 1) {
        return 1;
      }
      if (xxx[a + 1][b] == -1) {
        if (_killChek(xxx, a + 1, b) == 1) {
          return 1;
        }
      }
    }
    if (b > 0) {
      if (xxx[a][b - 1] == 1) {
        return 1;
      }
      if (xxx[a][b - 1] == -1) {
        if (_killChek(xxx, a, b - 1) == 1) {
          return 1;
        }
      }
    }
    if (b < 9) {
      if (xxx[a][b + 1] == 1) {
        return 1;
      }
      if (xxx[a][b + 1] == -1) {
        if (_killChek(xxx, a, b + 1) == 1) {
          return 1;
        }
      }
    }
    return 0;
  }

  static _kill(xx, a, b) {
    xx[a][b] = -2;
    if (a > 0) {
      if (xx[a - 1][b] != -2) {
        if (xx[a - 1][b] != -1) {
          xx[a - 1][b] = -3;
        } else {
          _kill(xx, a - 1, b);
        }
      }
    }
    if (a < 9) {
      if (xx[a + 1][b] != -2) {
        if (xx[a + 1][b] != -1) {
          xx[a + 1][b] = -3;
        } else {
          _kill(xx, a + 1, b);
        }
      }
    }
    if (b > 0) {
      if (xx[a][b - 1] != -2) {
        if (xx[a][b - 1] != -1) {
          xx[a][b - 1] = -3;
        } else {
          _kill(xx, a, b - 1);
        }
      }
    }
    if (b < 9) {
      if (xx[a][b + 1] != -2) {
        if (xx[a][b + 1] != -1) {
          xx[a][b + 1] = -3;
        } else {
          _kill(xx, a, b + 1);
        }
      }
    }
    if ((a > 0) && (b > 0)) {
      xx[a - 1][b - 1] = -3;
    }
    if ((a > 0) && (b < 9)) {
      xx[a - 1][b + 1] = -3;
    }
    if ((a < 9) && (b > 0)) {
      xx[a + 1][b - 1] = -3;
    }
    if ((a < 9) && (b < 9)) {
      xx[a + 1][b + 1] = -3;
    }
  }
}

void main() {
  List<List<int>> pole1Me = [
    [1, 1, 1, 1, 0, 0, 1, 1, 1, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 1, 0, 0, 0, 0, 0],
    [1, 0, 1, 0, 1, 0, 0, 0, 0, 0],
    [0, 0, 1, 0, 1, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 1, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 1, 0, 1, 0, 1, 0, 1, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  ];

  List<List<int>> pole1You = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  ];

  [pole1Me, pole1You] = GameService.shot(pole1Me, pole1You, 2, 4);
  [pole1Me, pole1You] = GameService.shot(pole1Me, pole1You, 3, 4);
  [pole1Me, pole1You] = GameService.shot(pole1Me, pole1You, 4, 4);
}
