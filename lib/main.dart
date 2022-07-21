import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class TodoItem {
  String title;
  bool done;

  TodoItem({required this.title, required this.done});

  toJSONEncodable() {
    Map<String, dynamic> m = {};
    m['title'] = title;
    m['done'] = done;
    return m;
  }
}

class TodoList {
  List<TodoItem> items = [];
  toJSONEncodable() {
    return items.map((item) {
      return item.toJSONEncodable();
    }).toList();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final TodoList list = TodoList();
  final LocalStorage storage = LocalStorage('todo_app');
  bool initialized = false;
  TextEditingController controller = TextEditingController();

  _toggleItem(TodoItem item) {
    setState(() {
      item.done = !item.done;
      _saveToStorage();
    });
  }

  _addItem(String title) {
    setState(() {
      final item = new TodoItem(title: title, done: false);
      list.items.add(item);
      _saveToStorage();
    });
  }

  _saveToStorage() {
    storage.setItem('todos', list.toJSONEncodable());
  }

  _clearStorage() async {
    await storage.clear();

    setState(() {
      list.items = storage.getItem('todos') ?? [];
    });
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localstorage demo'),
      ),
      body: Container(
          padding: const EdgeInsets.all(10.0),
          constraints: const BoxConstraints.expand(),
          child: FutureBuilder(
            future: storage.ready,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (!initialized) {
                var items = storage.getItem('todos');

                if (items != null) {
                  list.items = List<TodoItem>.from(
                    (items as List).map(
                      (item) => TodoItem(
                        title: item['title'],
                        done: item['done'],
                      ),
                    ),
                  );
                }

                initialized = true;
              }

              List<Widget> widgets = list.items.map((item) {
                return CheckboxListTile(
                  value: item.done,
                  title: Text(item.title),
                  selected: item.done,
                  onChanged: (_) {
                    _toggleItem(item);
                  },
                );
              }).toList();

              return Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ListView(
                      children: widgets,
                      itemExtent: 50.0,
                    ),
                  ),
                  ListTile(
                    title: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        labelText: 'What to do?',
                      ),
                      onEditingComplete: _save,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.save),
                          onPressed: _save,
                          tooltip: 'Save',
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: _clearStorage,
                          tooltip: 'Clear storage',
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }

  void _save() {
    _addItem(controller.value.text);
    controller.clear();
  }
}
