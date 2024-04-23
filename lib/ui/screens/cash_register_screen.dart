import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

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
      appBar: AppBar(title: Text('Касса'),),
      body: Center(
        child: _isLoading
            ? buildCashBoxScreen()
            : const CircularProgressIndicator(),
      ),
    );
  }

  buildCashBoxScreen() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text(
              'СОО Саблезубый заяц',
              style: textTheme.headlineLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.business,
                  size: 60,
                ),
                Column(
                  children: [
                    Text(
                      'УНП: ${Constants.unp}',
                      style: textTheme.headlineMedium,
                    ),
                    Text(
                      'РН: ${Constants.cashboxNumber}',
                      style: textTheme.headlineMedium,
                    ),
                  ],
                )
              ],
            ),
            FilledButton(
              onPressed: () {},
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Кассир: ${Constants.cashierId}',
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.0),
                    child: Icon(
                      Icons.change_circle,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 250,
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text(
                'Открыть смену',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Смена №ХХ',
                ),
                Text(
                  '${DateFormat.yMd().format(DateTime.now())} ${DateFormat.Hms().format(DateTime.now())}',
                ),
              ],
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/cashbox_screen');
              },
              child: const Text('Денежный ящик'),
            ),
          ],
        ),
      ),
    );
  }
}
