import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sea_warship/enums.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: _buildGameTable(
                context,
                [
                  [1, 1, 1, 0, 0, -3, -1, -1, 1, 0],
                  [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 1, 0, -3, -2, 0, 0, -3, 0, 0],
                  [0, 1, 0, 0, -2, 0, 0, 0, 0, 0],
                  [0, 0, -3, 0, -2, 0, -3, 0, -3, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [-2, -2, 0, 0, 0, -3, 0, 0, 0, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [0, 0, 1, 0, -2, 0, 1, 0, -2, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                ],
                TableType.my),
          ),
          Center(
            child: _buildGameTable(
                context,
                [
                  [-1, -1, -1, 1, 0, 0, -2, -2, -2, 0],
                  [0, 0, 0, 0, 0, -3, 0, 0, 0, 0],
                  [1, 0, -3, 0, 1, 0, 0, 0, 0, 0],
                  [1, 0, 1, 0, 1, 0, 0, -3, 0, 0],
                  [0, -3, 1, 0, 1, -3, 0, 0, -3, 0],
                  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  [-2, -2, 0, -3, 0, -3, 0, 0, 0, 0],
                  [0, -3, -3, 0, 0, 0, 0, 0, -3, 0],
                  [0, 0, 1, 0, 1, 0, 1, 0, 1, 0],
                  [0, 0, 0, -3, 0, 0, 0, 0, 0, 0]
                ],
                TableType.enemy),
          ),
        ],
      ),
    );
  }

  Table _buildGameTable(
      BuildContext context, List<List<int>> matrix, TableType type) {
    double cellWidth = (MediaQuery.of(context).size.width -
            (100 * (MediaQuery.of(context).size.width / 400))) /
        20;

    List<TableRow> table = [];

    for (int i = 0; i < 10; i++) {
      List<Widget> row = [];
      for (int j = 0; j < 10; j++) {
        row.add(
          GestureDetector(
            onTap: () {
              debugPrint('$i $j');
            },
            child: Container(
              color: getColorByNum(matrix[i][j], type),
              width: cellWidth,
              height: cellWidth,
              child: matrix[i][j] == -3 ? Icon(CupertinoIcons.clear) : null,
            ),
          ),
        );
      }
      table.add(TableRow(children: row));
    }

    return Table(
      columnWidths: {
        0: FixedColumnWidth(cellWidth),
        1: FixedColumnWidth(cellWidth),
        2: FixedColumnWidth(cellWidth),
        3: FixedColumnWidth(cellWidth),
        4: FixedColumnWidth(cellWidth),
        5: FixedColumnWidth(cellWidth),
        6: FixedColumnWidth(cellWidth),
        7: FixedColumnWidth(cellWidth),
        8: FixedColumnWidth(cellWidth),
        9: FixedColumnWidth(cellWidth),
      },
      children: table,
      border: TableBorder.all(width: 1, color: Colors.black54),
    );
  }

  static Color getColorByNum(int i, TableType type) {
    switch (i) {
      case 1:
        return type == TableType.my ? Colors.black26 : Colors.transparent;
      case -1:
        return Colors.orangeAccent;
      case -2:
        return Colors.redAccent;
      default:
        return Colors.transparent;
    }
  }
}
