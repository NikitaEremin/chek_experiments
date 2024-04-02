import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  String id;

  MenuItem({super.key, required this.id});

  final List<String> _reports = [
    'Х-отчет',
    'Копия Z-отчета',
    'Чеки',
    'Отчет по отделам',
  ];

  final List<String> _settings = [
    'Торговые настройки',
    'Печать документов',
    'Устройства',
    'Терминальный режим',
    'Безопасность'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
          children: getChildrens(),
        ));
  }

  getChildrens(){
    switch(id){
      case 'Отчёты': return _reports.map((e) {return ListTile(title: Text(e),);}).toList();
      case 'Настройки': return _settings.map((e) {return ListTile(title: Text(e));}).toList();
      case 'Касса': return [Placeholder()];
      case 'Техподдержка': return [Placeholder()];
    }
    print(_reports.map((e) {return Text(e);}).toList());
  }
}
