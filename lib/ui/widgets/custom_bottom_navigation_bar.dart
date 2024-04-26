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
    this.unselectedIconSize = 20,
    this.currentIndex = 0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        // boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), offset: Offset(0,3), blurRadius: 2, spreadRadius: 3)],
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < customBottomBarItems.length; i++) ...[
            // if (i == 2) ...[const SizedBox(width: 58)],
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
    this.unselectedIconSize = 20,
    this.currentIndex,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onTap(index);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
              color: currentIndex == index
                  ? Theme.of(context).colorScheme.surfaceTint
                  : Colors.transparent,
              width: 3,
            ))),
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Icon(
                  icon,
                  size: currentIndex == index
                      ? selectedIconSize
                      : unselectedIconSize,
                  color: currentIndex == index
                      ? Theme.of(context).colorScheme.surfaceTint
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
                          ? Theme.of(context).colorScheme.surfaceTint
                          : unSelectedColor,
                      fontWeight: currentIndex == index
                          ? FontWeight.bold
                          : FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
