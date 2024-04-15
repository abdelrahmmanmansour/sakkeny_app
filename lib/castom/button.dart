import 'package:flutter/material.dart';
import 'package:sakeny/costant.dart';

class CastomButton extends StatelessWidget {
  CastomButton({required this.onTap, required this.text});
  String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          height: 46,
          decoration: ShapeDecoration(
            color: Color(0xFF89ADA3),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.50, color: Color(0xFFD0D0D0)),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: primFont,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ))),
    );
  }
}

class CastomButton1 extends StatelessWidget {
  CastomButton1(
      {required this.onTap,
      required this.text,
      this.colorcontainer,
      this.colortext,
      this.text1,
      this.colortext1});
  String text;
  VoidCallback? onTap;
  Color? colortext;
  Color? colortext1;
  Color? colorcontainer;
  String? text1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
            width: double.infinity,
            height: 70,
            decoration: ShapeDecoration(
              color: colorcontainer,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.50, color: Color(0xFFD0D0D0)),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, right: 8),
                    child: Text(
                      text,
                      style: TextStyle(
                        color: colortext,
                        fontSize: 16,
                        fontFamily: primFont,
                        fontWeight: FontWeight.w900,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      "${text1}",
                      style: TextStyle(
                        color: colortext1,
                        fontSize: 16,
                        fontFamily: primFont,
                        fontWeight: FontWeight.w900,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class CastomButton2 extends StatelessWidget {
  CastomButton2({required this.onTap, required this.text});
  String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
            width: double.infinity,
            height: 60,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.50, color: Color(0xFFD0D0D0)),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: primFont,
                      fontWeight: FontWeight.w900,
                      height: 0,
                    ),
                  ),
                ))),
      ),
    );
  }
}

class CastomButton3 extends StatelessWidget {
  CastomButton3({required this.onTap, required this.text});
  String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          height: 46,
          decoration: ShapeDecoration(
            color:  Color(0xFFDADADA),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.50, color: Color(0xFFD0D0D0)),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color:  Color(0xFF858585),
                  fontSize: 16,
                  fontFamily: primFont,
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ))),
    );
  }
}
