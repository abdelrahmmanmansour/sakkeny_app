import 'dart:convert';
import 'package:flutter/material.dart';
class FavPost extends StatelessWidget {
  FavPost(
      {required this.image,
        required this.price,
        required this.location,
        required this.description,
      required this.onPress,required this.color,
      required this.ontap
      });
  String location;
  String price;
  String description;
  String image;
  void Function()? onPress;
  void Function()? ontap;
 Color color;


  @override
  Widget build(BuildContext context) {
    var images=base64Decode(image);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFF3EADA),
                ),
                width: 100,
                height: 50,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "أحمد طارق",
                      style: TextStyle(
                        color: Color(0xFF858585),
                        fontSize: 12,
                        fontFamily: 'Marhey',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(
                          "assets/images/ahme.png"),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 9,),
          GestureDetector(
            onTap: ontap,
            child: Container(
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
                        fit: BoxFit.cover,

                      ),
                    ),
                    const SizedBox(height:10),
                    Row(
                      children: [
                        Expanded(
                          child:IconButton(onPressed:
                             onPress,
                            icon:  ImageIcon(const AssetImage('assets/icons/Heart.png',),
                              size: 90,
                              color:color,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Column(
                          children: [
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

                          ],
                        ),

                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
