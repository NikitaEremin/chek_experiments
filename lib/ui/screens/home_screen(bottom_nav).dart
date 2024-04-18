import 'package:chek_experiments/ui/screens/cash_register_screen.dart';
import 'package:chek_experiments/ui/screens/reports_screen.dart';
import 'package:chek_experiments/ui/screens/sell_screen.dart';
import 'package:chek_experiments/ui/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        indicatorColor: AppColors.darkGreen.withOpacity(0.5),
        selectedIndex: _selectedPageIndex,
        backgroundColor: AppColors.littleGreen.withOpacity(0.5),
        overlayColor:
            MaterialStateProperty.all(AppColors.darkGreen.withOpacity(0.5)),
        onDestinationSelected: (value) => _openPage(value),
        destinations: [
          NavigationDestination(
            icon: Transform.translate(
              offset: const Offset(0,3),
              child: SvgPicture.asset(
                height: 32,
                // width:  36,
                _selectedPageIndex == 0
                    ? 'assets/images/cashbox_filled.svg'
                    : 'assets/images/cashbox_outlined.svg',
              ),
            ),
            // icon: Image.asset(_selectedPageIndex == 0
            //     ?'assets/images/cashbox_filled.png'
            //     :'assets/images/cashbox_outlined.png'),
            // icon: Icon(_selectedPageIndex == 0
            //     ? Icons.payments
            //     : Icons.payments_outlined),
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
