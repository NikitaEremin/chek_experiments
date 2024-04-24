import 'package:chek_experiments/ui/screens/documents_screen.dart';
import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  ReportsScreen({super.key});

  final List<Reports> _reports = [
    Reports(title: 'X-отчёт'),
    Reports(title: 'Копия Z-отчёта'),
    Reports(title: 'Кассовые документы'),
    Reports(title: 'Отчёт по отделам'),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            // leading: Icon(_reports[index].icon),
            contentPadding: const EdgeInsets.only(
              left: 16,
            ),
            onTap: () {
              if(index == 2){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DocumentScreen(),));
              }
            },
            title: Text(_reports[index].title),
          ),
          itemCount: _reports.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: 0,
          ),
        ),
    );
  }
}


//TODO вынести в модели
class Reports {
  String title;

  Reports({
    required this.title,
  });
}
