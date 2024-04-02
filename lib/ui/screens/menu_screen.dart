import 'package:chek_experiments/ui/theme/colors.dart';
import 'package:chek_experiments/ui/theme/text_styles.dart';
import 'package:chek_experiments/ui/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    List<MenuListItem> menuItems = [
      MenuListItem(icon: const Icon(Icons.point_of_sale), title: 'Касса'),
      MenuListItem(icon: const Icon(Icons.file_copy), title: 'Отчёты'),
      MenuListItem(icon: const Icon(Icons.settings), title: 'Настройки'),
      MenuListItem(icon: const Icon(Icons.help_center), title: 'Техподдержка'),
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(
            companyName: 'СОО "Саблезубый заяц"',
            unp: '123456789',
            cashboxNumber: '987654321',
          ),
          CashierInfo(
            identificator: 'Фамилия И.О.',
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (BuildContext context, int index) {
                if (menuItems[index].title == 'Касса') {
                  return ListTile(
                    leading: menuItems[index].icon,
                    title: Text(menuItems[index].title),
                    onTap: () {
                      Navigator.of(context).pushNamed('/cashbox_screen');
                    },
                  );
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
          Container(
            decoration: const BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: AppColors.darkGreen),
            )),
            height: MediaQuery.of(context).size.height * 0.07,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
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

class CashierInfo extends StatelessWidget {
  String identificator;

  CashierInfo({
    super.key,
    required this.identificator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Icon(Icons.person_outline_rounded, size: 25),
              ),
              Text('Кассир:   $identificator', style: AppTextStyles.menuText)
            ],
          ),
          const Divider(thickness: 2, color: AppColors.darkGreen),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  String companyName;
  String unp;
  String cashboxNumber;

  Header(
      {super.key,
      required this.companyName,
      required this.unp,
      required this.cashboxNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 45, 0, 10),
      width: MediaQuery.of(context).size.width,
      color: AppColors.darkGreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(companyName, style: AppTextStyles.headerText),
          const SizedBox(height: 15),
          Text('УНП: $unp', style: AppTextStyles.headerTextInfo),
          Text('РН: $cashboxNumber', style: AppTextStyles.headerTextInfo)
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
