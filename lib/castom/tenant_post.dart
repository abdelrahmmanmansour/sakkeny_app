// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:sakeny/castom/button.dart';
//
// class Post extends StatelessWidget {
//   Post(
//       {required this.image,
//         required this.price,
//         required this.location,
//         required this.description,
//       required this.onPress,
//         required this.colorFavorite
//       });
//   String location;
//   String price;
//   String description;
//   String image;
//   Color colorFavorite;
//
//   void Function()? onPress;
//   String _fixBase64(String base64) {
//     while (base64.length % 4 != 0) {
//       base64 += '=';
//     }
//     return base64;
//   }
//   @override
//   Widget build(BuildContext context) {
//     var fixedBase64 = _fixBase64(image);
//     var images = base64Decode(fixedBase64);
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: const Color(0xFFF3EADA),
//                 ),
//                 width: 100,
//                 height: 50,
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       "أحمد طارق",
//                       style: TextStyle(
//                         color: Color(0xFF858585),
//                         fontSize: 12,
//                         fontFamily: 'Marhey',
//                         fontWeight: FontWeight.w300,
//                         height: 0,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 8,
//                     ),
//                     CircleAvatar(
//                       radius: 15,
//                       backgroundImage: AssetImage(
//                           "assets/images/ahme.png"),
//                     ),
//                     SizedBox(
//                       width: 4,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 9,),
//           GestureDetector(
//             onTap: (){
//               Navigator.pushNamed(context, "tenant_view_post");
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                   border: Border.all(color: Color(0xffd0d0d0)),
//                   borderRadius: BorderRadius.circular(20)),
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8, left: 8),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: Image.memory(
//                         images,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     const SizedBox(height:10),
//                    Row(
//                      children: [
//                        Expanded(
//                            child:IconButton(onPressed:
//                               onPress,
//                                icon: Icon(Icons.favorite,color: colorFavorite,),
//                                // icon:  ImageIcon(AssetImage('assets/icons/love.png'),
//                                //           color: Colors.red,
//                                //           size: 90,
//                                // ),
//                                    ),
//                            ),
//                          Spacer(),
//                        Column(
//                          children: [
//                            RichText(
//                              textAlign: TextAlign.center,
//                              text: TextSpan(
//                                children: [
//                                  TextSpan(
//                                    text: "$price",
//                                    style: const TextStyle(
//                                      fontFamily: "Marhey",
//                                      fontSize: 16,
//                                      fontWeight: FontWeight.w300,
//                                      height: 2,
//                                      color: Color(0xff3e3e3e),
//                                    ),
//                                  ),
//                                  const TextSpan(
//                                    text: "ج.م شهرياً",
//                                    style: TextStyle(
//                                      fontFamily: "Marhey",
//                                      fontSize: 10,
//                                      fontWeight: FontWeight.w300,
//                                      height: 2,
//                                      color: Color(0xff858585),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Text(
//                              location,
//                              style: const TextStyle(
//                                fontFamily: "Marhey",
//                                fontSize: 12,
//                                fontWeight: FontWeight.w300,
//                                height: 1.67,
//                                color: Color(0xff3e3e3e),
//                              ),
//                            ),
//                            Text(
//                              description,
//                              textAlign: TextAlign.center,
//                              style: const TextStyle(
//                                fontFamily: "Marhey",
//                                fontSize: 12,
//                                fontWeight: FontWeight.w300,
//                                height: 2,
//                                color: Color(0xff858585),
//                              ),
//                            ),
//
//                          ],
//                        ),
//
//                      ],
//                    )
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';


class Post extends StatelessWidget {
  Post(
      {required this.image,
        required this.price,
        required this.location,
        required this.description,
        required this.onPress,
        required this.ontap,
        required this.colorFavorite,
        required this.nameText
      });
  String location;
  String price;
  String description;
  String image;
  Color colorFavorite;
  String nameText;

  void Function()? onPress;
  void Function()? ontap;

  // Helper function to fix Base64 padding
  // String _fixBase64(String base64) {
  //   while (base64.length % 4 != 0) {
  //     base64 += '=';
  //   }
  //   return base64;
  // }

  @override
  Widget build(BuildContext context) {
    // Fix the Base64 string before decoding
    // var fixedBase64 = _fixBase64(image);
    var images = base64Decode(image);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFF3EADA),
                  
                ),
          
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                    nameText,
                      style: const TextStyle(
                        color: Color(0xFF858585),
                        fontSize: 12,
                        fontFamily: 'Marhey',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(
                          "assets/images/ahme.png"),
                    ),
                    const SizedBox(
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
                            icon: Icon(Icons.favorite,color: colorFavorite,),
                            // icon:  ImageIcon(AssetImage('assets/icons/love.png'),
                            //           color: Colors.red,
                            //           size: 90,
                            // ),
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
                                    text: price,
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
                    ),
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
