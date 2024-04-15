import 'package:flutter/material.dart';
import 'package:sakeny/screens/onboarding_one.dart';
import 'package:sakeny/screens/onboarding_three.dart';
import 'package:sakeny/screens/onboarding_two.dart';
import 'package:sakeny/screens/sign_as.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<Widget> Screens = [
    const onboarding_one(),
    const onboarding_two(),
    const onboarding_three()
  ];
  final List<String> images = [
    "assets/images/onboarding one.png",
    "assets/images/onboarding two.png",
    "assets/images/onboarding three.png"
  ];
  final List<Color> colors = [Colors.blue, Colors.green, Colors.orange];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white12,
          elevation: 0,
          actions: [
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
                return sign_as();
              },));
            },
            child: const Text(
              "تخطى",
              style: TextStyle(
                  fontFamily: "Marhey", fontSize: 16, color: Colors.orange),
            ))
      ]),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            children: [
              const onboarding_one(),
              const onboarding_two(),
              const onboarding_three(),
            ],
          ),
          Positioned(
            bottom: 50.0,
            left: 10,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                Screens.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7.0),
      height: 10.0,
      width: 10.0,
      decoration: ShapeDecoration(
        color: const Color(0xFFF3EADA),
        shape: OvalBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: _currentPage == index ? const Color(0xFFFF8C40) : Colors.white,
          ),
        ),
      ),
    );
  }
}

class FadeInUp extends StatelessWidget {
  final Duration duration;
  final Widget child;

  FadeInUp({required this.duration, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: const Offset(0, 0.5), end: Offset.zero),
      duration: duration,
      curve: Curves.easeInOut,
      builder: (context, Offset offset, child) {
        return Transform.translate(
          offset: offset,
          child: child,
        );
      },
      child: child,
    );
  }
}
