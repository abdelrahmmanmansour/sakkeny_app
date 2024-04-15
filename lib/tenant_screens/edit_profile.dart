import 'package:flutter/material.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/castom/text_filed.dart';
import 'package:sakeny/costant.dart';

class EditProfile1 extends StatefulWidget {
  const EditProfile1({super.key});

  @override
  State<EditProfile1> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                const Text(
                  '  تعديل الحساب',
                  //textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF200E32),
                    fontSize: 16,
                    fontFamily: primFont,
                    fontWeight: FontWeight.w900,
                    height: 0,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const ImageIcon(
                    AssetImage("assets/images/Arrow - Right Square.png"),
                    color: orange,
                    size: 30,
                  ),
                ),
              ]),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 125,
                width: 145,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            AssetImage("assets/images/Avatars_2.png"),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        onPressed: () {},
                        icon: const ImageIcon(
                          AssetImage("assets/images/Edit.png"),
                          color: orange,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Castomtext2(
              //   isvible: false,
              // ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "الاسم",
                    style: TextStyle(
                        fontFamily: primFont,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )),
              SizedBox(
                height: 5,
              ),
              // CastomText(
              //   isvible: false,
              // ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "البريد الالكترونى",
                    style: TextStyle(
                        fontFamily: primFont,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )),
              SizedBox(
                height: 5,
              ),
              // CastomText(
              //   isvible: false,
              // ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "رقم الهاتف",
                    style: TextStyle(
                        fontFamily: primFont,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )),
              SizedBox(
                height: 5,
              ),
              // CastomText(
              //   isvible: false, textEditingController: ,
              // ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "العنوان",
                    style: TextStyle(
                        fontFamily: primFont,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )),
              SizedBox(
                height: 5,
              ),
              // CastomText(
              //   isvible: false,
              // ),
              SizedBox(
                height: 20,
              ),
              CastomButton(onTap: () {}, text: "حفظ التعديلات")
            ]),
          )),
    ));
  }
}
