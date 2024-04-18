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
      bottomNavigationBar: NavigationBar(
        indicatorColor: AppColors.darkGreen,
        selectedIndex: _selectedPageIndex,
        backgroundColor: AppColors.bottomNavBarColor,
        overlayColor:
            MaterialStateProperty.all(AppColors.darkGreen.withOpacity(0.5)),
        onDestinationSelected: (value) => _openPage(value),
        destinations: [
          NavigationDestination(
            // TODO svg/material(нет outlined)
            // icon: Transform.translate(
            //   offset: const Offset(0,3),
            //   child: SvgPicture.asset(
            //     height: 32,
            //     _selectedPageIndex == 0
            //         ? 'assets/images/cashbox_filled.svg'
            //         : 'assets/images/cashbox_outlined.svg',
            //   ),
            // ),

            icon: Icon(_selectedPageIndex == 0
                ? Icons.point_of_sale
                : Icons.point_of_sale_outlined),
            label: 'Касса',
          ),
          NavigationDestination(
            icon: Icon(
              _selectedPageIndex == 1
                  ? Icons.shopping_cart
                  : Icons.shopping_cart_outlined,
            ),
            label: 'Продажа',
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
    setState(() => _selectedPageIndex = index);
  }
}
