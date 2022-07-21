import 'package:flutter/material.dart';

class PedidosRealizadosPage extends StatefulWidget {
  const PedidosRealizadosPage({Key? key}) : super(key: key);

  @override
  State<PedidosRealizadosPage> createState() => _PedidosRealizadosPageState();
}

class _PedidosRealizadosPageState extends State<PedidosRealizadosPage> {
  @override
  bool isSwitched = false;
  String txt = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Operaciones realizadas'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                color: Colors.blue[50],
                child: ListTile(
                  leading: const Text("01/07/2022"),
                  title: const Text(
                    'Spicy Fire House ',
                    textScaleFactor: 1.5,
                  ),
                  trailing: Text("Q. 49.9"),
                  selected: true,
                  onTap: () {
                    setState(() {});
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                color: Colors.blue[50],
                child: ListTile(
                  leading: const Text("15/07/2022"),
                  title: const Text(
                    'Double x Cheedar ',
                    textScaleFactor: 1.5,
                  ),
                  trailing: Text("Q. 15.5"),
                  selected: true,
                  onTap: () {
                    setState(() {});
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                color: Colors.blue[50],
                child: ListTile(
                  leading: const Text("21/07/2022"),
                  title: const Text(
                    'Monster Chill  ',
                    textScaleFactor: 1.5,
                  ),
                  trailing: const Text("Q. 15.5"),
                  selected: true,
                  onTap: () {
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
