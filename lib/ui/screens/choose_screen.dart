
import 'package:flutter/material.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            TextButton(onPressed: (){Navigator.of(context).pushNamed('/menu_screen');}, child: Text('Старый вариант')),
            TextButton(onPressed: (){Navigator.of(context).pushNamed('/menu_screen(botton_nav)');}, child: Text('Новый вариант')),
          ],
        ),
      ),
    );
  }
}
