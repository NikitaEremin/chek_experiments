import 'package:chek_experiments/ui/constants.dart';
import 'package:chek_experiments/ui/theme/colors.dart';
import 'package:chek_experiments/ui/widgets/menu_item.dart';
import 'package:flutter/material.dart';

import '../widgets/header_widget.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    List<MenuListItem> menuItems = [
      MenuListItem(
          icon: const Icon(
            Icons.point_of_sale_outlined,
            size: 40,
            color: Colors.white,
          ),
          title: 'Касса'),
      MenuListItem(icon: const Icon(Icons.file_copy), title: 'Отчёты'),
      MenuListItem(icon: const Icon(Icons.settings), title: 'Настройки'),
      MenuListItem(icon: const Icon(Icons.help_center), title: 'Техподдержка'),
    ];

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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (BuildContext context, int index) {
                  if (menuItems[index].title == 'Касса') {
                    return FilledButton(
                        style: ButtonStyle(
                          minimumSize:
                          MaterialStateProperty.all(Size(double.maxFinite, 100)),
                          backgroundColor: MaterialStateProperty.all(AppColors.darkGreen),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                          elevation: MaterialStateProperty.all<double>(10),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/cashbox_screen');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            menuItems[index].icon,
                            Text(menuItems[index].title, style: TextStyle(fontSize: 30),),
                          ],
                        ));
                  } else {
                    return ExpansionTile(
                      leading: menuItems[index].icon,
                      title: Text(menuItems[index].title),
                      children: [MenuItem(id: menuItems[index].title)],
                    );
                  }
                },
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: AppColors.darkGreen),
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

class MenuListItem {
  final Icon icon;
  final String title;

  MenuListItem({required this.icon, required this.title});
}
