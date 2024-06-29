import 'package:flutter/material.dart';
import 'package:sakeny/Core/Services/CachedHelper.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/screens/login.dart';
import 'package:sakeny/screens/sign_as.dart';
import 'package:sakeny/screens/sign_up.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

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
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  const Text(
                    '  تسجيل الخروج ',
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
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF3EADA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    height: 210,
                    width: 334,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: IconButton(
                            onPressed: () {},
                            icon: const ImageIcon(
                              AssetImage("assets/icons/logout.png"),
                              color: orange,
                              size: 40,
                            ),
                          ),
                        ),
                        const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                ' هل أنت متاكد من تحويل الحساب الى مالك ',
                                style: TextStyle(
                                  fontFamily: primFont,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 55,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 135,
                                height: 34,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF858585),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.50, color: Color(0xFF868686)),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {},
                                    child: const Text(
                                      'الغاء',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Marhey',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {

                              },
                              child: Container(
                                width: 135,
                                height: 34,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF89ada3),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.50, color: Color(0xFFd0d0d0)),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: Center(
                                  child: InkWell(
                                      onTap: () {
                                        CacheHelper.removeData(key: "reId");
                                        CacheHelper.removeData(key: "retToken");
                                        CacheHelper.removeData(
                                            key: "userAccountType");


                                        Navigator.pushAndRemoveUntil(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return Login();
                                          },
                                        ), (route) => false);
                                      },
                                      child: const Text(
                                        'نعم',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Marhey',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
