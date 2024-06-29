import 'package:flutter/material.dart';
import 'package:sakeny/costant.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children:  [
             const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'الاشعارات',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: primFont,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'اليوم ',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Color(0xFF89ADA3),
                fontSize: 16,
                fontFamily: 'Marhey',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              margin: EdgeInsets.only(bottom: 10,top: 10),
              height: 84,
              decoration: ShapeDecoration(
                color: const Color(0xFFF3EADA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'لقد قام احمد طارق بالرد على تعليقك\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Marhey',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'قام احمد طارق بالرد على تعليقك على صحته',
                          style: TextStyle(
                            color: Color(0xFF858585),
                            fontSize: 12,
                            fontFamily: 'Marhey',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              margin: EdgeInsets.only(bottom: 10,top: 10),
              height: 84,
              decoration: ShapeDecoration(
                color: const Color(0xFFF3EADA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'لقد قام احمد طارق بالرد على تعليقك\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Marhey',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'قام احمد طارق بالرد على تعليقك على صحته',
                          style: TextStyle(
                            color: Color(0xFF858585),
                            fontSize: 12,
                            fontFamily: 'Marhey',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            const Text(
              'امس ',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Color(0xFF89ADA3),
                fontSize: 16,
                fontFamily: 'Marhey',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              margin: EdgeInsets.only(bottom: 10,top: 10),
              height: 84,
              decoration: ShapeDecoration(
                color: const Color(0xFFF3EADA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'لقد قام احمد طارق بالرد على تعليقك\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Marhey',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'قام احمد طارق بالرد على تعليقك على صحته',
                          style: TextStyle(
                            color: Color(0xFF858585),
                            fontSize: 12,
                            fontFamily: 'Marhey',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            const Text(
              'الثلاثاء ',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Color(0xFF89ADA3),
                fontSize: 16,
                fontFamily: 'Marhey',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              margin: EdgeInsets.only(bottom: 10,top: 10),
              height: 84,
              decoration: ShapeDecoration(
                color: const Color(0xFFF3EADA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'لقد قام احمد طارق بالرد على تعليقك\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Marhey',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'قام احمد طارق بالرد على تعليقك على صحته',
                          style: TextStyle(
                            color: Color(0xFF858585),
                            fontSize: 12,
                            fontFamily: 'Marhey',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              margin: EdgeInsets.only(bottom: 10,top: 10),
              height: 84,
              decoration: ShapeDecoration(
                color: const Color(0xFFF3EADA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'لقد قام احمد طارق بالرد على تعليقك\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Marhey',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'قام احمد طارق بالرد على تعليقك على صحته',
                          style: TextStyle(
                            color: Color(0xFF858585),
                            fontSize: 12,
                            fontFamily: 'Marhey',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              margin: EdgeInsets.only(bottom: 10,top: 10),
              height: 84,
              decoration: ShapeDecoration(
                color: const Color(0xFFF3EADA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'لقد قام احمد طارق بالرد على تعليقك\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Marhey',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'قام احمد طارق بالرد على تعليقك على صحته',
                          style: TextStyle(
                            color: Color(0xFF858585),
                            fontSize: 12,
                            fontFamily: 'Marhey',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),


          ],
        ),
      ),

    );
  }
}
