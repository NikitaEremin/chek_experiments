import 'package:chek_experiments/ui/screens/auth_screen.dart';
import 'package:chek_experiments/ui/screens/cashbox_screen.dart';
import 'package:chek_experiments/ui/screens/menu_screen.dart';
import 'package:flutter/material.dart';

final routes = <String, WidgetBuilder>{
  '/auth_screen': (BuildContext context) => const AuthScreen(),
  '/menu_screen': (BuildContext context) => const MenuScreen(),
  '/cashbox_screen': (BuildContext context) => const CashBoxScreen()
};