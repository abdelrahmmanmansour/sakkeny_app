import 'package:flutter/material.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/profile.dart/edit_profile.dart';
import 'package:sakeny/screens/log_out.dart';

class List extends StatelessWidget {
  const List({super.key});

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
                return EditProfile();
              },
            ));
          },
          text: "مرحبا,أحمد",
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
        CastomButton2(onTap: () {}, text: " اتصل بنا "),
         SizedBox(
          height: 25,
        ),
         CastomButton2(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Logout1();
          },));
         }, text: " تسجيل الخروج"),
      ],
    );
  }
}
