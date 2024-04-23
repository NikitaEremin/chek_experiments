import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class CashRegisterScreen extends StatefulWidget {
  CashRegisterScreen({super.key});

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
    return Scaffold(
      // appBar: AppBar(title: Text('Касса'),),
      body: Center(
        child: _isLoading
            ? buildCashBoxScreen()
            : const CircularProgressIndicator(),
      ),
    );
  }

  buildCashBoxScreen() {
    // TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          padding: const EdgeInsets.only(top: 36),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              color: colorScheme.surfaceTint,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16))),
          child: Row(
            children: [
              SizedBox(width: 48),
              FloatingActionButton(onPressed: (){}, child: Icon(Icons.person_2_outlined, size: 30,), backgroundColor: Colors.white,),
              SizedBox(width: 8,),
              Text(Constants.cashierId, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),)
            ],
          ),
        ),
        // FilledButton(
        //   onPressed: () {},
        //   child: const Row(
        //     mainAxisSize: MainAxisSize.min,
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       Text(
        //         'Кассир: ${Constants.cashierId}',
        //       ),
        //       Padding(
        //         padding: EdgeInsets.only(left: 6.0),
        //         child: Icon(
        //           Icons.change_circle,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
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
    );
  }
}
