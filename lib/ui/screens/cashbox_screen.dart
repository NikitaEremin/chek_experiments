import 'package:flutter/material.dart';

class CashBoxScreen extends StatefulWidget {
  const CashBoxScreen({super.key});

  @override
  State<CashBoxScreen> createState() => _CashBoxScreenState();
}

class _CashBoxScreenState extends State<CashBoxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Экран касса'),),
    );
  }
}
