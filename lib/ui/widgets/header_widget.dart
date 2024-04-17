import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/text_styles.dart';

class Header extends StatelessWidget {
  final String companyName;
  final String unp;
  final String cashboxNumber;
  final String cashierId;

  Header(
      {super.key,
      required this.companyName,
      required this.unp,
      required this.cashboxNumber,
      required this.cashierId});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColors.littleGreen,
          AppColors.darkGreen,

        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        // borderRadius: BorderRadius.vertical(
        //     top: Radius.zero, bottom: Radius.circular(30)),
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 35, 15, 15),
            child: Column(
              children: [
                Text(companyName, style: AppTextStyles.headerText),
                Text('УНП: $unp', style: AppTextStyles.headerTextInfo),
                Text('РН: $cashboxNumber', style: AppTextStyles.headerTextInfo),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person_2_outlined,
                      color: Colors.white,
                    ),
                    Text('Кассир:  $cashierId',
                        style: AppTextStyles.headerTextInfo),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
