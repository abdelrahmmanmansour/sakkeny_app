import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/costant.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const ImageIcon(
                          AssetImage("assets/images/Arrow - Right Square.png"),
                          color: orange,
                          size: 30,
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage("assets/images/Avatars_2.png"),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "hana mohamed",
                      style: TextStyle(
                          fontFamily: primFont,
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            "4.8",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: primFont,
                                fontSize: 14,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        InkWell(
                            onTap: () {},
                            child: Image.asset(
                              "assets/images/Star.png",
                              width: 20,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "السيرة الذاتية",
                        style: TextStyle(
                            fontFamily: primFont,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        textDirection: TextDirection.rtl,
                        "طالبة بكلية الحاسبات والمعلومات جامعة المنصورة\n 21 سنه من طنطا",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: primFont,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: Divider(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        " التعلقات والمراجعات",
                        style: TextStyle(
                            fontFamily: primFont,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "عمرو عويس",
                          style: TextStyle(
                              fontFamily: primFont,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/Avatars.png"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RatingBar.builder(
                          textDirection: TextDirection.rtl,
                          itemSize: 20,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        const Text(
                          "10/12/23",
                          style: TextStyle(
                              fontFamily: primFont,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      textDirection: TextDirection.rtl,
                      "سررت بمعرفة دكتور أحمد أتوجة لة بالشكر على حسن المعاملة",
                      style: TextStyle(
                          fontFamily: primFont,
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: Divider(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "عمرو عويس",
                          style: TextStyle(
                              fontFamily: primFont,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/Avatars.png"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RatingBar.builder(
                          textDirection: TextDirection.rtl,
                          itemSize: 20,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        const Text(
                          "10/12/23",
                          style: TextStyle(
                              fontFamily: primFont,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      textDirection: TextDirection.rtl,
                      "سررت بمعرفة دكتور أحمد أتوجة لة بالشكر على حسن المعاملة",
                      style: TextStyle(
                          fontFamily: primFont,
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: Divider(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "عمرو عويس",
                          style: TextStyle(
                              fontFamily: primFont,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/Avatars.png"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RatingBar.builder(
                          textDirection: TextDirection.rtl,
                          itemSize: 20,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        const Text(
                          "10/12/23",
                          style: TextStyle(
                              fontFamily: primFont,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      textDirection: TextDirection.rtl,
                      "سررت بمعرفة دكتور أحمد أتوجة لة بالشكر على حسن المعاملة",
                      style: TextStyle(
                          fontFamily: primFont,
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: Divider(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CastomButton(onTap: () {}, text: "اضافة تعليق")
                  ]),
                ))));
  }
}
