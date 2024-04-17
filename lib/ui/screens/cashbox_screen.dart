import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CashBoxScreen extends StatefulWidget {
  const CashBoxScreen({super.key});

  @override
  State<CashBoxScreen> createState() => _CashBoxScreenState();
}

class _CashBoxScreenState extends State<CashBoxScreen> {
  TextEditingController sumController = TextEditingController();
  RegExp fullyRegExp = RegExp(r"\d{1,9},\d{2}");
  RegExp commaRegExp = RegExp(r"\d*,");
  bool isCommaActive = true;
  bool isNotFully = true;
  bool backspaceOnly = true;

  onButtonPress(int index) {
    setState(() {
      switch (isNotFully) {
        case true:
          if (index == 9) {
            sumController.text += sumController.text.isEmpty ? '0,' : ',';
            isCommaActive =
                commaRegExp.hasMatch(sumController.text) ? false : true;
          } else if (index == 10) {
            sumController.text += '0';
          } else if (index == 11) {
            if (sumController.text.isNotEmpty) {
              sumController.text = sumController.text
                  .substring(0, sumController.text.length - 1);
              isCommaActive =
                  commaRegExp.hasMatch(sumController.text) ? false : true;
            } else {
              return;
            }
          } else {
            sumController.text += (index + 1).toString();
          }

          isNotFully = fullyRegExp.hasMatch(sumController.text) ? false : true;

        case false:
          if (index == 11) {
            sumController.text =
                sumController.text.substring(0, sumController.text.length - 1);
            isNotFully =
                fullyRegExp.hasMatch(sumController.text) ? false : true;
          }
          return;
      }
    });
  }

  Widget _buildButton(Widget child, int index, bool isActive) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: const BorderSide(width: 1.5, color: AppColors.littleGreen),
        textStyle: const TextStyle(fontSize: 30, fontFamily: 'Iskra'),
        backgroundColor: Colors.white,
        disabledBackgroundColor: Colors.grey[300],
      ),
      onPressed: isActive ? () => onButtonPress(index) : null,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Денежный ящик"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.littleGreen, width: 2.0),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white),
              child: TextField(
                style: const TextStyle(
                  fontSize: 60,
                ),
                maxLines: 1,
                textAlign: TextAlign.end,
                enableInteractiveSelection: false,
                autofocus: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                showCursor: false,
                keyboardType: TextInputType.none,
                controller: sumController,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 1.5 / 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: [
                      ...List.generate(
                        9,
                        (index) => _buildButton(
                            Text((index + 1).toString()), index, true),
                      ),
                      _buildButton(const Text(','), 9, isCommaActive),
                      _buildButton(const Text('0'), 10, true),
                      _buildButton(
                          const Icon(
                            Icons.backspace,
                            size: 30,
                          ),
                          11,
                          true),
                    ]),
              ),
            ),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('Внести'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Изъять'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
