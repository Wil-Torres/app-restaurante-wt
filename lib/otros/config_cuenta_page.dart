import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConfigCuentaPage extends StatefulWidget {
  const ConfigCuentaPage({Key? key}) : super(key: key);

  @override
  State<ConfigCuentaPage> createState() => CconfigCuentaPageState();
}

class CconfigCuentaPageState extends State<ConfigCuentaPage> {
  bool isSwitched = false;
  String txt = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Configuración de cuenta'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                color: Colors.blue[50],
                child: ListTile(
                  title: const Text(
                    'Nombre completo',
                    textScaleFactor: 1.5,
                  ),
                  trailing: Text("Hola que hace"),
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
                  title: const Text(
                    'Correo Electrónico',
                    textScaleFactor: 1.5,
                  ),
                  trailing: Text("Hola que hace"),
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
                  title: const Text(
                    'Telefono',
                    textScaleFactor: 1.5,
                  ),
                  trailing: Text("Hola que hace"),
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
                  title: const Text(
                    'Direccion',
                    textScaleFactor: 1.5,
                  ),
                  trailing: Text("lalasfsafasd"),
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
                  title: const Text(
                    'Bitficaciones',
                    textScaleFactor: 1.5,
                  ),
                  trailing: Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
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
                  title: const Text(
                    'Tarjeta de Credito',
                    textScaleFactor: 1.5,
                  ),
                  trailing: const Icon(Icons.arrow_right),
                  selected: true,
                  onTap: () {
                    setState(() {});
                  },
                ),
              ),
            ),
            Text(
              txt,
              textScaleFactor: 2,
            )
          ],
        ));
  }
}
