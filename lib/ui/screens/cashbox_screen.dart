import 'package:flutter/material.dart';

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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(color: Colors.black, fontSize: 26),
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), side: BorderSide.none),
      ),
      onPressed: isActive ? () => onButtonPress(index) : null,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme tt = Theme.of(context).textTheme;
    // ColorScheme cs = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Денежный ящик"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                          textStyle: tt.titleMedium,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          fixedSize: Size(double.infinity, 70)),
                      onPressed: () {},
                      child: const Text('Внести'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: FilledButton.tonal(
                      style: FilledButton.styleFrom(
                          textStyle: tt.titleMedium,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          fixedSize: Size(double.infinity, 70)),
                      onPressed: () {},
                      child: const Text('Изъять'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.35,
              child: TextField(
                style: const TextStyle(
                  fontSize: 60,
                ),
                maxLines: 1,
                textAlign: TextAlign.end,
                enableInteractiveSelection: false,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: '0.00',
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
                          const Icon(Icons.backspace, size: 30), 11, true),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
