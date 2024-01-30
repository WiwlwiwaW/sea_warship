import 'package:flutter/material.dart';

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
                [1, 1, 1, 0, 0, 0, 1, 1, 1, 0],
                [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
                [0, 1, 0, 0, 1, 0, 0, 0, 0, 0],
                [0, 1, 0, 0, 1, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [1, 1, 0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 1, 0, 1, 0, 1, 0, 1, 0],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
              ],
            ),
          ),
          Center(
            child: _buildGameTable(
              context,
              [
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Table _buildGameTable(BuildContext context, List<List<int>> matrix) {
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
              color: matrix[i][j] == 0 ? Colors.transparent : Colors.black12,
              width: cellWidth,
              height: cellWidth,
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
}
