import 'package:flutter/material.dart';
import 'package:sea_warship/pages/game_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Морской бой',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 40,
                ),
                FilledButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GamePage(),
                    ),
                  ),
                  // onPressed: () {
                  //   List<List<int>> pole1Me = [
                  //     [1, 1, 1, 1, 0, 0, 1, 1, 1, 0],
                  //     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  //     [1, 0, 0, 0, 1, 0, 0, 0, 0, 0],
                  //     [1, 0, 1, 0, 1, 0, 0, 0, 0, 0],
                  //     [0, 0, 1, 0, 1, 0, 0, 0, 0, 0],
                  //     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  //     [1, 1, 0, 0, 0, 0, 0, 0, 0, 0],
                  //     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  //     [0, 0, 1, 0, 1, 0, 1, 0, 1, 0],
                  //     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                  //   ];

                  //   List<List<int>> pole1You = [
                  //     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  //     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  //     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  //     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  //     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  //     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  //     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  //     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  //     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  //     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                  //   ];

// <<<<<<< HEAD
//                     if (GameService.createShip(pole1You, 4, 4, 2) == 1){
//                       print("Корабль создан.");
//                     }
//                     if (GameService.createShip(pole1You, 4, 6, 2) == 1){
//                       print("Корабль создан.");
//                     }
//                     if (GameService.createShip(pole1You, 4, 5, 3) == 1){
//                       print("Корабль создан.");
//                     }
//                     for (int i = 0; i < 10; i++){
//                       print(pole1You[i]);
//                     }
//                   },
// =======
                  //   if (GameService.createShip(pole1You, 4, 4, 3) == 1){
                  //     print("Корабль создан.");
                  //   }
                  //   if (GameService.createShip(pole1You, 4, 5, 3) == 1){
                  //     print("Корабль создан.");
                  //   }
                  //   if (GameService.createShip(pole1You, 4, 6, 3) == 1){
                  //     print("Корабль создан.");
                  //   }
                  //   for (int i = 0; i < 10; i++){
                  //     print(pole1You[i]);
                  //   }
                  // },
// >>>>>>> fcf039f906e05194c4bca3383b9d0dd9214f2188
                  icon: const Icon(Icons.add),
                  label: const Text('Создать игру'),
                ),
                const SizedBox(
                  height: 10,
                ),
                FilledButton.tonalIcon(
                  onPressed: () => _displayDialog(context),
                  icon: const Icon(Icons.wifi),
                  label: const Text('Подключиться к игре'),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  _displayDialog(BuildContext context) async => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Подключение к игре'),
            content: TextField(
              controller: _textFieldController,
              textInputAction: TextInputAction.go,
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(hintText: "Введите код игры"),
            ),
            actions: <Widget>[
              Theme(
                data: ThemeData(colorSchemeSeed: Colors.redAccent),
                child: TextButton(
                  child: const Text('Закрыть'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              TextButton(
                child: const Text('Войти'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
}
