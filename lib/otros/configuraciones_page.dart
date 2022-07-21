import 'package:app_restaurante_wt/otros/acerca_de_page.dart';
import 'package:app_restaurante_wt/otros/config_cuenta_page.dart';
import 'package:app_restaurante_wt/otros/contactenos_page.dart';
import 'package:app_restaurante_wt/otros/pedidos_realizados_page.dart';
import 'package:flutter/material.dart';

class ConfiguracionesPage extends StatefulWidget {
  const ConfiguracionesPage({Key? key}) : super(key: key);

  @override
  State<ConfiguracionesPage> createState() => _ConfiguracionesPageState();
}

class _ConfiguracionesPageState extends State<ConfiguracionesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            color: Colors.blue[50],
            child: ListTile(
              title: const Text(
                'Configuracion de Cuenta',
                textScaleFactor: 1.5,
              ),
              trailing: const Icon(Icons.arrow_right),
              selected: true,
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const ConfigCuentaPage()));
                });
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
                'Operaciones Realizadas',
                textScaleFactor: 1.5,
              ),
              trailing: const Icon(Icons.arrow_right),
              selected: true,
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const PedidosRealizadosPage()));
                });
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
                'Contactenos',
                textScaleFactor: 1.5,
              ),
              trailing: const Icon(Icons.arrow_right),
              selected: true,
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const ContactenosPage()));
                });
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
                'Acerca de Nosotros',
                textScaleFactor: 1.5,
              ),
              trailing: const Icon(Icons.arrow_right),
              selected: true,
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const AcercaDePage()));
                });
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
                'Cerrar Sesión',
                textScaleFactor: 1.5,
              ),
              trailing: const Icon(Icons.exit_to_app),
              selected: true,
              onTap: () {
                setState(() {});
              },
            ),
          ),
        )
      ],
    );
  }
}
