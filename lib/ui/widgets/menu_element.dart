import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../theme/colors.dart';

class MenuElement extends StatelessWidget {
  final IconData icon;
  final String title;

  const MenuElement({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: FilledButton(
        style: ButtonStyle(
          minimumSize:
          MaterialStateProperty.all(const Size(double.maxFinite, 75)),
          backgroundColor: MaterialStateProperty.all(AppColors.mediumGreen),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
          elevation: MaterialStateProperty.all<double>(7.5),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/cashbox_screen');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, size: 25),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 30, color: AppColors.cardContent),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
