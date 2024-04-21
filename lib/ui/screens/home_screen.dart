import 'package:chek_experiments/ui/screens/cash_register_screen.dart';
import 'package:chek_experiments/ui/screens/nomenclature_screen.dart';
import 'package:chek_experiments/ui/screens/reports_screen.dart';
import 'package:chek_experiments/ui/screens/sell_screen.dart';
import 'package:chek_experiments/ui/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;
  final List<Widget> _pages = [
    CashRegisterScreen(),
    const NomenclatureScreen(),
    ReportsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SellScreen()));
        },
        // elevation: 0,
        // shape: const CircleBorder(),
        child: const Icon(Icons.shopping_cart),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedPageIndex,
        onDestinationSelected: (value) => _openPage(value),
        destinations: [
          NavigationDestination(
            icon: Icon(_selectedPageIndex == 0
                ? Icons.point_of_sale
                : Icons.point_of_sale_outlined),
            label: 'Касса',
          ),
          NavigationDestination(
            icon: Icon(
              _selectedPageIndex == 1
                  ? Icons.inventory_2
                  : Icons.inventory_2_outlined,
            ),
            label: 'Товары',
          ),
          NavigationDestination(
            icon: Icon(_selectedPageIndex == 2
                ? Icons.summarize
                : Icons.summarize_outlined),
            label: 'Отчеты',
          ),
          NavigationDestination(
            icon: Icon(_selectedPageIndex == 3
                ? Icons.settings
                : Icons.settings_outlined),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }

  void _openPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
}
