import 'package:chek_experiments/ui/theme/colors.dart';
import 'package:chek_experiments/ui/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'router/routes.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.littleGreen,
        textTheme: AppTextStyles.textTheme,
        fontFamily: 'Iskra',
        scaffoldBackgroundColor: AppColors.bgColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.littleGreen),
        useMaterial3: true,

      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: '/splash_screen',
    );
  }
}