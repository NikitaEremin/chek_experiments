import 'package:chek_experiments/ui/screens/cashier_screen.dart';
import 'package:chek_experiments/ui/screens/nomenclature_screen.dart';
import 'package:chek_experiments/ui/screens/reports_screen.dart';
import 'package:chek_experiments/ui/screens/sell_screen.dart';
import 'package:chek_experiments/ui/screens/settings_screen.dart';
import 'package:chek_experiments/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;
  final List<Widget> _pages = [
    const CashierScreen(),
    const NomenclatureScreen(),
    const SellScreen(),
    ReportsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIconSize: 30,
        unSelectedColor: Colors.grey[500],
        currentIndex: _selectedPageIndex,
        customBottomBarItems: [
          CustomBottomBarItems(icon: Icons.point_of_sale, label: 'Касса'),
          CustomBottomBarItems(icon: Icons.inventory_2, label: 'Товары'),
          CustomBottomBarItems(icon: Icons.shopping_cart, label: 'Продажа'),
          CustomBottomBarItems(icon: Icons.summarize, label: 'Отчеты'),
          CustomBottomBarItems(icon: Icons.settings, label: 'Настройки'),
        ],
        onTap: (int index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
      ),
    );
  }

  void openPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
}
