import 'package:chek_experiments/ui/screens/cash_register_screen.dart';
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
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedPageIndex,

        customBottomBarItems: [
          CustomBottomBarItems(icon: Icons.point_of_sale, label: 'Касса',),
          CustomBottomBarItems(icon: Icons.inventory_2, label: 'Товары'),
          CustomBottomBarItems(icon: Icons.summarize, label: 'Отчеты'),
          CustomBottomBarItems(icon: Icons.settings, label: 'Настройки'),
        ],
        onTap: (int index) { setState(() {
          _selectedPageIndex = index;
        });},),
    );
  }

  void openPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
}





class BottomBarItem extends StatelessWidget {

  // final Function(int) onTap;
  final int index;
  final IconData icon;
  final String label;

  const BottomBarItem({
    super.key,
    // required this.onTap,
    required this.index,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){},
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.green, width: 3)
              )
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                Text(label)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

