import 'package:flutter/material.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,

      child: Scaffold(
        appBar: AppBar(
          title: const Text('Кассовые документы'),
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.sell), text: 'Продажи'),
            Tab(icon: Icon(Icons.compare_arrows), text: 'Возвраты'),
            Tab(icon: Icon(Icons.cancel), text: 'Отмены'),
          ],),
        ),
        body: TabBarView(
          children: [
            ListView.builder(itemBuilder: (context, index) => ListTile(title: Text(index.toString()),),),
            ListView.builder(itemBuilder: (context, index) => ListTile(title: Text(index.toString()),),),
            ListView.builder(itemBuilder: (context, index) => ListTile(title: Text(index.toString()),),),
          ],
        ),
      ),
    );
  }
}
