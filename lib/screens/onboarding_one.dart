import 'package:flutter/material.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/screens/onboarding_two.dart';

class onboarding_one extends StatelessWidget {
  const onboarding_one({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 30, top: 100),
      child: Column(
        children: [
          Container(
            width: 353,
            height: 353,
            child: Image.asset("assets/images/onboarding one.png"),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "سهولة التواصل",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                height: 0.07,
                letterSpacing: 0.20,
                fontFamily: 'Marhey'),
          ),
          const SizedBox(
            height: 60,
          ),
          const Text(
            "محادثات بين المالك والمستأجر",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w300,
                height: 0.09,
                letterSpacing: 0.20,
                fontFamily: 'Marhey'),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "لتسهيل عملية الايجار",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w300,
                height: 0.09,
                letterSpacing: 0.20,
                fontFamily: 'Marhey'),
          ),
          const SizedBox(
            height: 60,
          ),
          /* Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const ShapeDecoration(
                    color: Color(0xFFF3EADA),
                    shape: OvalBorder(
                      side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Color((0xFFFF8C40))),
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 10,
                height: 10,
                decoration: const ShapeDecoration(
                  color: Color(0xFFF3EADA),
                  shape: OvalBorder(),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 10,
                height: 10,
                decoration: const ShapeDecoration(
                  color: Color(0xFFF3EADA),
                  shape: OvalBorder(),
                ),
              ),

            ],
          ),*/
          /*SizedBox(height: 20,),
          CastomButton(onTap: (){ Navigator.push(context, MaterialPageRoute(builder: ((BuildContext context) {
                  return onboarding_two();
                })));}, text: "NEXT"),*/
        ],
      ),
    ));
  }
}
