import 'package:chek_experiments/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'router/routes.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: AppColors.bgColor,
        fontFamily: 'Iskra',
        scaffoldBackgroundColor: AppColors.bgColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      routes: routes,
      initialRoute: '/splash_screen',
    );
  }
}