import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class CashRegisterScreen extends StatefulWidget {
  const CashRegisterScreen({super.key});

  @override
  State<CashRegisterScreen> createState() => _CashRegisterScreenState();
}

class _CashRegisterScreenState extends State<CashRegisterScreen> {
  final bool _isLoading = true;

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 1), () {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      // appBar: AppBar(title: Text('Касса'),),
      child: _isLoading
          ? buildCashBoxScreen()
          : const CircularProgressIndicator(),
    );
  }

  buildCashBoxScreen() {
    // TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme
        .of(context)
        .colorScheme;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 36, bottom: 8),
          width: double.infinity,
          // height: 150,
          decoration: BoxDecoration(
            color: colorScheme.surfaceTint,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(width: 48),
                  Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Icon(
                          Icons.person_2_outlined,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    Constants.cashierId,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  )
                ],
              ),
              const Text(
                '№ кассы: ${Constants.cashboxNumber}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                Constants.companyName,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              const Text(
                'УНП: ${Constants.unp}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        OutlinedButton(
            onPressed: () {},
            child: const Text('Открыть смену')
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Смена №ХХ',
            ),
            Text(
              '${DateFormat.yMd().format(DateTime.now())} ${DateFormat.Hms()
                  .format(DateTime.now())}',
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
    );
  }
}
