import 'package:chek_experiments/ui/screens/auth_screen.dart';
import 'package:chek_experiments/ui/screens/cash_register_screen.dart';
import 'package:chek_experiments/ui/screens/cashbox_screen.dart';
import 'package:chek_experiments/ui/screens/home_screen(bottom_nav).dart';
import 'package:chek_experiments/ui/screens/menu_screen.dart';
import 'package:chek_experiments/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

final routes = <String, WidgetBuilder>{
  '/auth_screen': (BuildContext context) => const AuthScreen(),
  '/menu_screen': (BuildContext context) => const MenuScreen(),
  '/cash_register_screen': (BuildContext context) => CashRegisterScreen(),
  '/splash_screen': (BuildContext context) => const SplashScreen(),
  '/home_screen': (BuildContext context) => const HomeScreen(),
  '/menu_screen(botton_nav)': (BuildContext context) => const HomeScreen(),
  '/cashbox_screen': (BuildContext context) => const CashBoxScreen(),
};

const initialRoute = '/splash_screen';