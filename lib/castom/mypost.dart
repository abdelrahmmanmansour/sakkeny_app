import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sakeny/castom/button.dart';

class CastomMypost extends StatelessWidget {
  CastomMypost(
      {required this.image,
      required this.price,
      required this.location,
      required this.description,
      required this.ontap
      });
  String location;
  String price;
  String description;
  String image;
  void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    var images=base64Decode(image);
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffd0d0d0)),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8, left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.memory(
                images,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$price",
                    style: const TextStyle(
                      fontFamily: "Marhey",
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      height: 2,
                      color: Color(0xff3e3e3e),
                    ),
                  ),
                  const TextSpan(
                    text: "ج.م شهرياً",
                    style: TextStyle(
                      fontFamily: "Marhey",
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      height: 2,
                      color: Color(0xff858585),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              location,
              style: const TextStyle(
                fontFamily: "Marhey",
                fontSize: 12,
                fontWeight: FontWeight.w300,
                height: 1.67,
                color: Color(0xff3e3e3e),
              ),
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "Marhey",
                fontSize: 12,
                fontWeight: FontWeight.w300,
                height: 2,
                color: Color(0xff858585),
              ),
            ),
            const SizedBox(height: 20),
            CastomButton(
                onTap: ontap,
                text: "اظهار الاعلان"),
          ],
        ),
      ),
    );
  }
}
