import 'package:flutter/material.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/log%20out/log_out.dart';
import 'package:sakeny/profile.dart/edit_profile.dart';
import 'package:sakeny/tenant_screens/edit_profile.dart';

class List1 extends StatelessWidget {
  const List1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        SizedBox(
          height: 20,
        ),
        CastomButton1(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return EditProfile1();
              },
            ));
          },
          text: "مرحبا,hana",
          colorcontainer: Colors.white,
          colortext: Colors.black,
          text1: "تعديل الحساب",
          colortext1: Colors.grey,
        ),
        SizedBox(
          height: 25,
        ),
        CastomButton2(onTap: () {}, text: "نبذة عننا"),
        SizedBox(
          height: 25,
        ),
        CastomButton2(onTap: () {}, text: " سياسة الخصوصية"),
        SizedBox(
          height: 25,
        ),
        CastomButton2(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Logout();
                },
              ));
            },
            text: "الدخول ك مالك "),
        SizedBox(
          height: 25,
        ),
        CastomButton2(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Logout();
                },
              ));
            },
            text: "تسجيل الخروج "),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
