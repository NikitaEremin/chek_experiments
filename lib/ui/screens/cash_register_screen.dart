
import 'package:intl/intl.dart';
import 'package:chek_experiments/ui/theme/text_styles.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../theme/colors.dart';

class CashRegisterScreen extends StatefulWidget {
  CashRegisterScreen({super.key});

  @override
  State<CashRegisterScreen> createState() => _CashRegisterScreenState();
}

class _CashRegisterScreenState extends State<CashRegisterScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.mediumGreen.withOpacity(0.7),
        title: const Text(
          'Касса',
          style: AppTextStyles.headerText,
        ),
      ),
      body: Center(
        child: _isLoading
            ? buildCashBoxScreen()
            : const CircularProgressIndicator(),
      ),
    );
  }

  buildCashBoxScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'УНП: ${Constants.unp}',
                style: AppTextStyles.menuText,
              ),
              Text(
                'РН: ${Constants.cashboxNumber}',
                style: AppTextStyles.menuText,
              ),
            ],
          ),
          FilledButton(
            style: ButtonStyle(
              minimumSize:
                  MaterialStateProperty.all(Size(double.maxFinite, 50)),
              backgroundColor: MaterialStateProperty.all(AppColors.mediumGreen),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              elevation: MaterialStateProperty.all<double>(5),
            ),
            onPressed: () {},
            child: const Text(
              'Открыть смену', style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Смена №ХХ',
                style: AppTextStyles.menuText,
              ),

              Text(
                '${DateFormat.yMd().format(DateTime.now())} ${DateFormat.Hms().format(DateTime.now())}',
                style: AppTextStyles.menuText,
              ),
            ],
          ),
          FilledButton(
            style: ButtonStyle(
              minimumSize:
              MaterialStateProperty.all(Size(double.maxFinite, 50)),
              backgroundColor: MaterialStateProperty.all(AppColors.mediumGreen),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              elevation: MaterialStateProperty.all<double>(5),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/cashbox_screen');
            },
            child: const Text(
              'Денежный ящик', style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
