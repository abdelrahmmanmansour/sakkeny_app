//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/nav_screens/myposts.dart';
import 'package:sakeny/screens/sign_as.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 8),
          child: ListView(
            children: [
              Image.asset(
                'assets/images/OTP 1.png',
                width: 242.80,
                height: 248.84,
              ),
              SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'ادخل رمز التأكيد',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF89ADA3),
                    fontSize: 20,
                    fontFamily: primFont,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: ' cv3fe@gmail.com',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: primFont,
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: 'لقد تم ارسال الرمز على الرقم ',
                        style: TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 16,
                          fontFamily: primFont,
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 50,
                        child: TextField(
                          autofocus: true,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: "",
                          ),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 50,
                        child: TextField(
                          autofocus: true,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: "",
                          ),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 50,
                        child: TextField(
                          autofocus: true,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: "",
                          ),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 50,
                        child: TextField(
                          autofocus: true,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: "",
                          ),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      " اعادة الارسال",
                      style: TextStyle(
                          color: Color(0xFFFF8C40),
                          fontSize: 16,
                          fontFamily: primFont,
                          fontWeight: FontWeight.w300,
                          height: 0),
                    ),
                  ),
                  const Text(
                    "لم يتم وصول الرمز ؟",
                    style: TextStyle(
                      color: Color(0xFF858585),
                      fontSize: 16,
                      fontFamily: primFont,
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 90,
              ),
              CastomButton(
                onTap: () {
                  Const.kind
                      ? Navigator.pushNamed(context, "nav")
                      : Navigator.pushNamed(context, "nav_tenant");
                },
                text: "تأكيد",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
