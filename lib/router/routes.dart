import 'package:chek_experiments/ui/screens/auth_screen.dart';
import 'package:chek_experiments/ui/screens/cashier_screen.dart';
import 'package:chek_experiments/ui/screens/cashbox_screen.dart';
// import 'package:chek_experiments/ui/screens/menu_screen.dart';
import 'package:chek_experiments/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import '../ui/screens/home_screen.dart';

final routes = <String, WidgetBuilder>{
  '/auth_screen': (BuildContext context) => const AuthScreen(),
  // '/menu_screen': (BuildContext context) => const MenuScreen(),
  '/cash_register_screen': (BuildContext context) => CashierScreen(),
  '/splash_screen': (BuildContext context) => const SplashScreen(),
  '/home_screen': (BuildContext context) => const HomeScreen(),
  '/cashbox_screen': (BuildContext context) => const CashBoxScreen(),
};

const initialRoute = '/splash_screen';