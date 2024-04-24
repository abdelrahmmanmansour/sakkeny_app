import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sakeny/Data/Model/GetPostDataUser.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/costant.dart';

class ViewPost extends StatelessWidget {
   ViewPost({super.key,required this.getPostDataUser});
GetPostDataUser getPostDataUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constrains) {
            return SizedBox(
              //height:  constrains.maxHeight/2,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: ListView.separated(
                      itemCount: getPostDataUser.postPicTbls!.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 12,
                        );
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(top: 4, right: 20, left: 20),
                          child: Container(
                            width: 331,
                            height: 200,
                            decoration: const BoxDecoration(

                            ),
                            child: Image.memory(base64Decode(getPostDataUser.postPicTbls![index].pictureString.toString())),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
              ],
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.2,
              minChildSize: 0.1,
              maxChildSize: .8,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(45),
                        topLeft: Radius.circular(45)),
                    child: Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        controller: scrollController,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              const Center(
                                child: ImageIcon(
                                  AssetImage("assets/images/Arrow - Up 2.png"),
                                  size: 35,
                                ),
                              ),
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
                              Align(
                                alignment: Alignment.topRight,
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "6000",
                                        style: TextStyle(
                                          fontFamily: "Marhey",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          height: 2,
                                          color: Color(0xff3e3e3e),
                                        ),
                                      ),
                                      TextSpan(
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
                              ),
                              const Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  " المنصورة ، حي الجامعة",
                                  style: TextStyle(
                                    fontFamily: "Marhey",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    height: 1.67,
                                    color: Color(0xff3e3e3e),
                                  ),
                                ),
                              ),
                              const Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    " 150 غرف نوم 2 حمامات",
                                    style: TextStyle(
                                      color: Color(0xFF858585),
                                      fontSize: 12,
                                      fontFamily: 'Marhey',
                                      fontWeight: FontWeight.w300,
                                      height: 0,
                                    ),
                                  )),

                              const Divider(
                                color: Colors.grey,
                              ),
                              Container(
                                  width: 138,
                                  height: 30,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xAFF3EADA),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: const Text(
                                            'عرض على الخريطة',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFF858585),
                                              fontSize: 12,
                                              fontFamily: 'Marhey',
                                              fontWeight: FontWeight.w300,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, "map");
                                        },
                                        icon: const Icon(
                                          Icons.location_on,
                                          color: orange,
                                        ),
                                        alignment: Alignment.topCenter,
                                      ),
                                    ],
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              const Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "شقة مفروشة للايجار بحي الجامعة للطلبة حتى 6 افراد ",
                                    style: TextStyle(
                                      color: Color(0xFF5B5B5B),
                                      fontFamily: "Marhey",
                                      fontSize: 13,
                                    ),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              const Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'المزايا والخدمات ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: primFont,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: const Color(0xAFF3EADA),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Center(
                                            child: Text(
                                          "  عداد مياه ",
                                          style: TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 12,
                                            fontFamily: 'Marhey',
                                          ),
                                        ))),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: const Color(0xAFF3EADA),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Center(
                                            child: Text(
                                          "عداد كهرباء ",
                                          style: TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 12,
                                            fontFamily: 'Marhey',
                                          ),
                                        ))),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: const Color(0xAFF3EADA),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Center(
                                            child: Text(
                                          "اجهزة مطبخ مدمجة ",
                                          style: TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 12,
                                            fontFamily: 'Marhey',
                                          ),
                                        ))),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: const Color(0xAFF3EADA),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Center(
                                            child: Text(
                                          "مصعد  ",
                                          style: TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 12,
                                            fontFamily: 'Marhey',
                                          ),
                                        ))),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: const Color(0xAFF3EADA),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Center(
                                            child: Text(
                                          "خدمة WifI ",
                                          style: TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 12,
                                            fontFamily: 'Marhey',
                                          ),
                                        ))),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: const Color(0xAFF3EADA),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Center(
                                            child: Text(
                                          "غاز طبيعي ",
                                          style: TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 12,
                                            fontFamily: 'Marhey',
                                          ),
                                        ))),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: const Color(0xAFF3EADA),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Center(
                                            child: Text(
                                          "خط ارضي ",
                                          style: TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 12,
                                            fontFamily: 'Marhey',
                                          ),
                                        ))),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: const Color(0xAFF3EADA),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Center(
                                            child: Text(
                                          "كاميرات مراقبة ",
                                          style: TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 12,
                                            fontFamily: 'Marhey',
                                          ),
                                        ))),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: const Color(0xAFF3EADA),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Center(
                                            child: Text(
                                          "شرفة او تراس ",
                                          style: TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 12,
                                            fontFamily: 'Marhey',
                                          ),
                                        ))),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: const Color(0xAFF3EADA),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Center(
                                            child: Text(
                                          "تكييف مركزي ",
                                          style: TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 12,
                                            fontFamily: 'Marhey',
                                          ),
                                        ))),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child:
                                        CastomButton(onTap: () {}, text: "نشر"),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: CastomButton(
                                        onTap: () {}, text: "تعديل"),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              // Add more list tiles or widgets as needed
                            ],
                          ),
                        ),
                      ),
                    ));
              }),
        ]),
      ),
    );
  }
}
