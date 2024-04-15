
import 'package:chek_experiments/ui/screens/cash_register_screen.dart';
import 'package:chek_experiments/ui/screens/reports_screen.dart';
import 'package:chek_experiments/ui/screens/sell_screen.dart';
import 'package:chek_experiments/ui/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;
  final List<Widget> _pages = [
    CashRegisterScreen(),
    SellScreen(),
    ReportsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedPageIndex],
        bottomNavigationBar:
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(36),
                  )),
              child: NavigationBar(
                indicatorColor: AppColors.endGradient.withOpacity(0.7),
                selectedIndex: _selectedPageIndex,
                backgroundColor: AppColors.startGradient.withOpacity(0.4),
                elevation: 15,
                // indicatorColor: AppColors.littleGreen,
                // indicatorColor: Colors.red,
                // animationDuration: Duration(seconds: 1),
                onDestinationSelected: (value) => _openPage(value),
                destinations: const [
                  NavigationDestination(
                      icon: Icon(Icons.point_of_sale), label: 'Касса'),
                  NavigationDestination(
                      icon: Icon(Icons.shopping_cart), label: 'Продажа'),
                  NavigationDestination(
                      icon: Icon(Icons.summarize), label: 'Отчеты'),
                  NavigationDestination(
                      icon: Icon(Icons.settings), label: 'Настройки'),
                ],
              ),
            ),
        );
  }

  void _openPage(int index) {
    setState(() => _selectedPageIndex = index);
  }
}
