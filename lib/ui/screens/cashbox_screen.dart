import 'package:chek_experiments/ui/theme/text_styles.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CashBoxScreen extends StatefulWidget {
  CashBoxScreen({super.key});

  @override
  State<CashBoxScreen> createState() => _CashBoxScreenState();
}

class _CashBoxScreenState extends State<CashBoxScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
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
        backgroundColor: AppColors.darkGreen,
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
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        FilledButton(
          onPressed: () {},
          child: Text('Открыть смену'),
        )
      ],
    );
  }
}
