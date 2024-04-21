import 'package:chek_experiments/ui/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _login = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
    final screenSize = MediaQuery.of(context).size;
    // final theme = Theme.of(context);
    // bool isObscured = true;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: screenSize.height * (1 - 0.8)),
          width: screenSize.width,
          height: screenSize.height,
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     colors: <Color>[
          //       Theme.of(context).colorScheme.primary,
          //       Theme.of(context).colorScheme.inversePrimary,
          //     ],
          //   ),
          // ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 56),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  // height: screenSize.height / 4.5,
                  child: Image.asset('assets/images/logo_dark.png'),
                ),
                const SizedBox(
                  height: 48,
                ),
                SizedBox(
                  // width: screenSize.width / 1.5,
                  child: Column(
                    children: [
                      TextField(
                        controller: _login,
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(),
                            label: Text(
                              'Логин',
                            )),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: _password,
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.visibility),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                          border: const OutlineInputBorder(),
                          label: const Text(
                            'Пароль',
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      FilledButton(
                        style: FilledButton.styleFrom(
                            minimumSize: const Size(double.infinity, 48),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6))),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const HomeScreen()));
                        },
                        child: const Text('Войти'),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text('РУП "ИЗДАТЕЛЬСТВО "БЕЛБЛАНКАВЫД"'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}


