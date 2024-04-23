import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Color? backgroundColor;
  final List<CustomBottomBarItems> customBottomBarItems;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final int currentIndex;

  final Function(int) onTap;
  final double selectedIconSize;
  final double unselectedIconSize;

  const CustomBottomNavigationBar({
    super.key,
    this.backgroundColor,
    this.selectedColor,
    required this.customBottomBarItems,
    this.unSelectedColor,
    this.selectedIconSize = 20,
    this.unselectedIconSize = 15,
    this.currentIndex = 0,
    required this.onTap,

  });

  /// body of nav bar.
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), offset: Offset(0,3), blurRadius: 10, spreadRadius: 3)],
        color: Theme.of(context).colorScheme.surfaceVariant,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          for (int i = 0; i < customBottomBarItems.length; i++) ...[
            Expanded(
              child: CustomLineIndicatorBottomNavbarItems(
                selectedColor: selectedColor,
                unSelectedColor: unSelectedColor,
                icon: customBottomBarItems[i].icon,
                label: customBottomBarItems[i].label,
                unselectedIconSize: unselectedIconSize,
                selectedIconSize: selectedIconSize,
                currentIndex: currentIndex,
                index: i,
                onTap: onTap,
              ),
            ),
          ],
        ],
      ),
    );
  }
}


class CustomBottomBarItems {
  final IconData icon;
  final String label;

  CustomBottomBarItems({
    required this.icon,
    required this.label,
  });
}


class CustomLineIndicatorBottomNavbarItems extends StatelessWidget {

  final IconData? icon;
  final String? label;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final double selectedIconSize;
  final double unselectedIconSize;
  final int? currentIndex;
  final int index;
  final Function(int) onTap;


  const CustomLineIndicatorBottomNavbarItems({
    super.key,
    this.icon,
    this.label,
    this.selectedColor,
    this.unSelectedColor,
    this.selectedIconSize = 25,
    this.unselectedIconSize = 15,
    this.currentIndex,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onTap(index);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: currentIndex == index
                      ? Colors.green
                      : Colors.transparent,
                  width: 3,
                )
              )
            ),
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: currentIndex == index
                      ? Colors.green
                      : unSelectedColor,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  '$label',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    color: currentIndex == index
                        ? Colors.green
                        : unSelectedColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
