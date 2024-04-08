import 'package:chek_experiments/ui/constants.dart';
import 'package:chek_experiments/ui/theme/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/header_widget.dart';
import '../widgets/menu_element.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(
            companyName: Constants.companyName,
            unp: Constants.unp,
            cashboxNumber: Constants.cashboxNumber,
            cashierId: Constants.cashierId,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: ListView(
                children: const [
                  MenuElement(icon: Icons.point_of_sale, title: 'Касса',),
                  MenuElement(icon: Icons.receipt, title: 'Отчеты',),
                  MenuElement(icon: Icons.settings, title: 'Настройки',),
                  MenuElement(icon: Icons.contact_support_outlined, title: 'Техподдержка',),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: AppColors.mediumGreen),
            )),
            height: MediaQuery.of(context).size.height * 0.07,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/auth_screen');
              },
              child: const ListTile(
                leading: Icon(Icons.logout_outlined),
                title: Text('Выход'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

