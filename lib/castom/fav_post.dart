import 'package:flutter/material.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/costant.dart';

class FavPost extends StatelessWidget {
  FavPost(
      {required this.image,
        required this.price,
        required this.location,
        required this.description});
  String location;
  String price;
  String description;
  String image;



  @override
  Widget build(BuildContext context) {
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
          SizedBox(height: 9,),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, "tenant_view_post");
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffd0d0d0)),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8, left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height:10),
                    Row(
                      children: [
                        Expanded(
                          child:IconButton(onPressed:
                              (){},
                            icon:  ImageIcon(AssetImage('assets/icons/Heart.png'),
                              size: 90,
                              color: orange,
                            ),
                          ),
                        ),
                        Spacer(),
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
