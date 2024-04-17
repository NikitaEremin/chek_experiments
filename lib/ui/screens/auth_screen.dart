import 'package:flutter/material.dart';
import '../theme/colors.dart';

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
    _login.addListener(() { });
    _password.addListener(() { });
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: screenSize.height * (1 - 0.85)),
          width: screenSize.width,
          height: screenSize.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  AppColors.littleGreen,
                  AppColors.darkGreen,
                ],
              )),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: screenSize.width / 1.6,
                height: screenSize.height / 4.67,
                child: Image.asset('assets/images/logo.png'),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: screenSize.width / 1.5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              border:
                              Border.all(width: 1, color: Colors.black12),
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: _login,
                              decoration: const InputDecoration(
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  label: Text(
                                    'Логин',
                                    style: TextStyle(color: Colors.black54),
                                  )),
                            ),
                          ),
                        ),
                        Text(
                          '@4ek.by',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Iskra',
                            fontSize: 20,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _password,
                        obscureText: true,
                        decoration: const InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            label: Text(
                              'Пароль кассира',
                              style: TextStyle(color: Colors.black54),
                            )),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1.3,
                            color: Colors.white.withOpacity(0.75),
                          )),
                      child: Material(
                        color: Colors.grey.withOpacity(0.25),
                        child: Stack(children: [
                          Center(
                              child: Text(
                                'ВОЙТИ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                    fontFamily: 'Iskra',
                                    color: Colors.white.withOpacity(0.75)),
                              )),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/menu_screen(botton_nav)');
                              // print('${_login.text}@4ek.by');
                            },
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline_rounded, size: 40,), color: Colors.white,),
                ),
              ),
              const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'РУП "ИЗДАТЕЛЬСТВО "БЕЛБЛАНКАВЫД"',
                    style: TextStyle(color: Colors.white, fontFamily: 'Iskra'),
                  )),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
