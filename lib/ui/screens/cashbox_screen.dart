import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/colors.dart';

class CashBoxScreen extends StatefulWidget {
  const CashBoxScreen({super.key});

  @override
  State<CashBoxScreen> createState() => _CashBoxScreenState();
}

class _CashBoxScreenState extends State<CashBoxScreen> {
  TextEditingController sumController = TextEditingController();

  onButtonPress(int index) {
    setState(() {
      if (index == 9) {
        sumController.text += ',';
      } else if (index == 10) {
        sumController.text += '0';
      } else if (index == 11) {
        if (sumController.text.isNotEmpty) {
          sumController.text =
              sumController.text.substring(0, sumController.text.length - 1);
        } else {
          return;
        }
      } else {
        sumController.text += (index + 1).toString();
      }
    });
  }

  Widget _buildButton(Widget child, int index) {
    return FilledButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.mediumGreen),
          elevation: MaterialStateProperty.all(5),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          iconSize: MaterialStateProperty.all(30),
          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
      onPressed: () => onButtonPress(index),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text("Денежный ящик"),),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.mediumGreen, width: 2.0),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white),
              child: Column(
                children: [
                  TextField(
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.allow(
                    //       RegExp(r'^\d*\.?\d{0,2}$')),
                    // ],
                    textAlign: TextAlign.right,
                    // enableInteractiveSelection: false,
                    autofocus: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    // showCursor: false,
                    // keyboardType: TextInputType.none,
                    controller: sumController,
                  ),
                  Text('Тут должна быть сумма'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.symmetric(vertical: 16),
                child: GridView.count(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    crossAxisCount: 3,
                    children: [
                      ...List.generate(
                        9,
                        (index) =>
                            _buildButton(Text((index + 1).toString()), index),
                      ),
                      _buildButton(Text(','), 9),
                      _buildButton(Text('0'), 10),
                      _buildButton(Icon(Icons.backspace), 11),
                    ]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){}, child: Text('Внести')),
                ElevatedButton(onPressed: (){}, child: Text('Изъять')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
