import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/constants.dart';

class CashierScreen extends StatefulWidget {
  const CashierScreen({super.key});

  @override
  State<CashierScreen> createState() => _CashierScreenState();
}

class _CashierScreenState extends State<CashierScreen> {
  String date = '';

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 42, bottom: 8, left: 16),
            width: double.infinity,
            color: colorScheme.surfaceTint,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  color: colorScheme.surface.withOpacity(0.5),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // const SizedBox(width: 48),
                          Icon(
                            Icons.person_2_outlined,
                            size: 30,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            Constants.cashierId,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Касса:    ${Constants.cashboxNumber}',
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            date = DateFormat.yMd()
                                    .format(DateTime.now())
                                    .toString() +
                                (DateFormat.Hms().format(DateTime.now()))
                                    .toString();
                          });
                        },
                        child: const Text('Открыть смену')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Смена №ХХ'),
                        Text(date)
                      ],
                    ),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/cashbox_screen');
                        },
                        child: const Text('Денежный ящик')),
                    const Text('Статистика'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
