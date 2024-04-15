import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> items = List.generate(20, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dismissible Example'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              key: Key(item),
              background: Container(
                color: Colors.red,
                child: Icon(Icons.delete),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20.0),
              ),
              onDismissed: (direction) {
                // Выполните действие по удалению элемента из списка
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$item удален')));
                setState(() {
                  items.removeAt(index);
                });
              },
              child: ListTile(
                title: Text(item),
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          shape: CircleBorder(),
          onPressed: () {
            // Действие при нажатии на FAB
          },
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.greenAccent,
          notchMargin: 4,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  // Действие при нажатии на кнопку "Домой"
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  // Действие при нажатии на кнопку "Профиль"
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}