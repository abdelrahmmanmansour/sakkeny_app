import 'package:flutter/material.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/castom/text_filed.dart';
import 'package:sakeny/nav_screens/post_details.dart';
import 'package:sakeny/screens/view_post.dart';

class suggestpractice extends StatelessWidget {
  const suggestpractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/images/Arrow - Right Square.png",
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                "السعر المقترح",
                style: TextStyle(
                  fontFamily: "Marhey",
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  height: 2,
                  letterSpacing: 0.23,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                height: 44,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffff8c40)),
                  color: const Color(0xfff8f2e9),
                ),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: "Marhey",
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        height: 2,
                        color: Color(0xff00000),
                      ),
                      children: [
                        TextSpan(
                          text: "6000",
                          style: TextStyle(
                            fontFamily: "Marhey",
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff3e3e3e),
                          ),
                        ),
                        TextSpan(
                          text: "ج.م شهريا",
                          style: TextStyle(
                            fontFamily: "Marhey",
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff858585),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text(
                  "هل انت موافق على اظهار هذا السعر للمستأجر",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: "Marhey",
                    fontSize: 13,
                    height: 2,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(100, 0, 0, 45),
                width: double.infinity,
                height: 36,
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: 58,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffff8c40)),
                            color: const Color(0x99f3eada),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Text(
                              "لا",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Marhey",
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                height: 2,
                                color: Color(0xff858585),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 33,
                      ),
                      Container(
                        width: 58,
                        height: double.infinity,
                        decoration: ShapeDecoration(
                          color: const Color(0x3f808080),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "نعم",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Marhey",
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              height: 2,
                              color: Color(0xff858585),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // CastomText(
              //   isvible: false,
              //   onChange: (data) {},
              //   hintText: "أدخل السعر (ج.م)",
              // ),
              const SizedBox(
                height: 20,
              ),
              CastomButton(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ViewPost(); 
                },));
              }, text: "التالى")
            ],
          ),
        ),
      ),
    );
  }
}
