import 'package:flutter/material.dart';

class ContactenosPage extends StatelessWidget {
  const ContactenosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contactenos'),
        ),
        body: Center(
          child: ListView(
            children: const [
              Center(child: Image(image: AssetImage('graficos/ContacUS.jpg'))),
              Center(child: Text("Telefono: 123456789 ")),
              Center(child: Text("Email: text@test.com")),
            ],
          ),
        ));
  }
}
