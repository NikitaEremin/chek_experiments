import 'package:chek_experiments/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _login = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _obscured = true;

  @override
  void initState() {
    _login.addListener(() {});
    _password.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _login.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 56),
        child: Center(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  // mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset(Constants.darkLogo),
                    ),
                    const SizedBox(height: 48),
                    TextField(
                      controller: _login,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        // border: OutlineInputBorder(),
                        label: Text('Логин'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _password,
                      obscureText: _obscured,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {setState(() {
                            _obscured = !_obscured;
                          });},
                          icon: const Icon(Icons.visibility),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        // border: const OutlineInputBorder(),
                        label: const Text('Пароль'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        // backgroundColor: Colors.green[400]
                          minimumSize: const Size(double.infinity, 48),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6))),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const HomeScreen()));
                      },
                      child: const Text('Войти', style: TextStyle(fontSize: 20),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Text('ver. 3.0.0\nРУП "Издательство "БЕЛБЛАНКАВЫД"', textAlign: TextAlign.center,),
    );
  }
}
