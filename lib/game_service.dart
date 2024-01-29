class GameService {
  static List<List<List<int>>> shot(
      List<List<int>> x, List<List<int>> y, int a, int b) {
    List<List<int>> xx = _deepCopy(x);
    List<List<int>> yy = _deepCopy(y);
    if ((x[a][b] == 1)) {
      xx[a][b] = -1;
      yy[a][b] = -1;
      if (_killChek(_deepCopy(xx), a, b) == 0) {
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

  static int createShip(List<List<int>> p, int x, int y, int size){
    if ((x > 0) && (y > 0)){
      if ((p[x-1][y-1] == 1) || (p[x-1][y-1] == 2)){
        return -1;
      }
    }
    if ((x > 0) && (y < 9)){
      if ((p[x-1][y+1] == 1) || (p[x-1][y+1] == 2)){
        return -1;
      }
    }
    if ((x < 9) && (y > 0)){
      if ((p[x+1][y-1] == 1) || (p[x+1][y-1] == 2)){
        return -1;
      }
    }
    if ((x < 9) && (y < 9)){
      if ((p[x+1][y+1] == 1) || (p[x+1][y+1] == 2)){
        return -1;
      }
    }
    if (x > 0){
      if (p[x-1][y] == 1){
        return -1;
      }
    }
    if (x < 9){
      if (p[x+1][y] == 1){
        return -1;
      }
    }
    if (y > 0){
      if (p[x][y-1] == 1){
        return -1;
      }
    }
    if (y < 9){
      if (p[x][y+1] == 1){
        return -1;
      }
    }
    int a = _sizeShip(_deepCopy(p), x, y, size-1);
    if (a == 0){
      p[x][y] = 1;
      _privatShip(p, x, y);
      return 1;
    }
    if (a > 0){
      p[x][y] = 2;
      return 2;
    }
    return -1;
  }

  static int _sizeShip(List<List<int>> p, int x, int y, int size){
    p[x][y] = 3;
    if (x > 0){
      if (p[x-1][y] == 2){
        size = _sizeShip(p, x-1, y, size-1);
      } 
    }
    if (x < 9){
      if (p[x+1][y] == 2){
        size = _sizeShip(p, x+1, y, size-1);
      } 
    }
    if (y > 0){
      if (p[x][y-1] == 2){
        size = _sizeShip(p, x, y-1, size-1);
      } 
    }
    if (y < 9){
      if (p[x][y+1] == 2){
        size = _sizeShip(p, x, y+1, size-1);
      } 
    }
    return size;
  }

  static _privatShip(List<List<int>> p, int x, int y){
    p[x][y] = 1;
    if (x > 0){
      if (p[x-1][y] == 2){
        _privatShip(p, x-1, y);
      }
    }
    if (x < 9){
      if (p[x+1][y] == 2){
        _privatShip(p, x+1, y);
      }
    }
    if (y > 0){
      if (p[x][y-1] == 2){
        _privatShip(p, x, y-1);
      }
    }
    if (y < 9){
      if (p[x][y+1] == 2){
        _privatShip(p, x, y+1);
      }
    }
  }

  static List<List<int>> deleteShip(List<List<int>> p, int x, int y){
    p[x][y] = 0;
    if (x > 0){
      if (p[x-1][y] == 1){
        deleteShip(p, x-1, y);
      }
    }
    if (x < 9){
      if (p[x+1][y] == 1){
        deleteShip(p, x+1, y);
      }
    }
    if (y > 0){
      if (p[x][y-1] == 1){
        deleteShip(p, x, y-1);
      }
    }
    if (y < 9){
      if (p[x][y+1] == 1){
        deleteShip(p, x, y+1);
      }
    }
    return p;
  }

  static List<List<int>> _deepCopy(List<List<int>> x){
    List<List<int>> xx = [];
      for (int i = 0; i < 10; i++) {
        List<int> be = [];
        for (int j = 0; j < 10; j++) {
          be.add(x[i][j]);
        }
        xx.add(be);
      }
    return xx;
  }
}