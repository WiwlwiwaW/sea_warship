import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Морской бой',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 40,
                ),
                FilledButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: const Text('Создать комнату'),
                ),
                SizedBox(
                  height: 10,
                ),
                FilledButton.tonalIcon(
                  onPressed: () => _displayDialog(context),
                  icon: Icon(Icons.wifi),
                  label: const Text('Подключиться к игре'),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  _displayDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Подключение к игре'),
            content: TextField(
              controller: _textFieldController,
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(hintText: "Введите код игры"),
            ),
            actions: <Widget>[
              Theme(
                data: ThemeData(colorSchemeSeed: Colors.redAccent),
                child: TextButton(
                  child: Text('Закрыть'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              TextButton(
                child: Text('Войти'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
}
