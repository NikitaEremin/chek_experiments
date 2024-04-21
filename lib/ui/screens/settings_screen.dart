import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final List<Settings> _settings = [
    Settings(title: 'Торговые настройки', icon: Icons.sell),
    Settings(title: 'Печать документов', icon: Icons.print),
    Settings(title: 'Устройства', icon: Icons.devices),
    Settings(title: 'Терминальный режим', icon: Icons.settings_remote),
    Settings(title: 'Безопасность', icon: Icons.security),
    Settings(title: 'Техподдержка', icon: Icons.contact_support),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Настройки'),),
      body: ListView.separated(
        itemBuilder: (context, index) =>
            ListTile(
              leading: Icon(_settings[index].icon),
              contentPadding: const EdgeInsets.only(left: 16,),
              onTap: () {},
              title: Text(_settings[index].title),
            ),
        itemCount: _settings.length,
        separatorBuilder: (context, index) => const SizedBox(height: 0,),
      ),
    );
  }
}


//TODO вынести в модели
class Settings {
  String title;
  IconData icon;

  Settings({
    required this.title,
    required this.icon
  });
}