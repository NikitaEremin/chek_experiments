import 'package:chek_experiments/ui/screens/auth_screen.dart';
import 'package:chek_experiments/ui/screens/transitions.dart';
import 'package:chek_experiments/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Animation<double> _fadeanimation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, -1), // Начать смещение сверху
      end: const Offset(0, 0), // Завершить смещение в центр
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut, // Применить кривую анимации
    ));

    _fadeanimation = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(FadeTransitionRoute(widget: AuthScreen()));
      }
    });
  }


  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: FadeTransition(
        opacity: _fadeanimation,
        child: Container(
          padding: EdgeInsets.only(top: screenSize.height * (1 - 0.85)),
          width: screenSize.width,
          height: screenSize.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 0.65],
            colors: <Color>[
              AppColors.startGradient,
              AppColors.darkGreen,
            ],
          )),
          child: Column(
            children: [
              SlideTransition(
                position: _animation,
                child: SizedBox(
                    width: screenSize.width / 1.6,
                    height: screenSize.height / 4.67,
                    child: Image.asset('assets/images/logo.png')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
