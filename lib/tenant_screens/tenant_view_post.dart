import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/costant.dart';

class TenantViewPost extends StatelessWidget {
  const TenantViewPost({super.key});



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
                      ListView.separated(
                        itemCount: 5,
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
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/download (3).png"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          );
                        },
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
              initialChildSize: 0.4,
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
                                        text: "7000",
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
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "12",
                                    style: TextStyle(
                                      color: Color(0xFF858585),
                                      fontSize: 12,
                                      fontFamily: 'Marhey',
                                      fontWeight: FontWeight.w300,
                                      height: 0,
                                    ),
                                  ),
                                  ImageIcon(AssetImage('assets/icons/Heart.png'),
                                      color: Color(0xFF858585)),
                                  Spacer(),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                            "حمام 2 غرف نوم 2 150م",
                                        style: TextStyle(
                                          color: Color(0xFF858585),
                                          fontSize: 12,
                                          fontFamily: 'Marhey',
                                          fontWeight: FontWeight.w300,
                                          height: 0,
                                        ),
                                      )),

                                ],
                              ),

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
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  benefit(pros: "  عداد مياه "),
                                  benefit(pros: "عداد كهرباء " ),
                                  benefit(pros:  "اجهزة مطبخ مدمجة "),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                 benefit(pros:"مصعد  " ),
                                  benefit(pros:"خدمة WifI " ),
                                  benefit(pros:"غاز طبيعي " ),
                                  benefit(pros: "خط ارضي ")
                                ],
                              ),
                              const SizedBox(
                                height: 15
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                benefit(pros:  "كاميرات مراقبة "),
                                benefit(pros: "شرفة او تراس "),
                                 benefit(pros:" تكييف مركزي")
                                ],
                              ),
                              const SizedBox(
                                height:15,
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
                                height: 20,
                              ),
                             review(),
                              review(),

                              const SizedBox(
                                height: 30,
                              ),

                              // Add more list tiles or widgets as needed
                            ],
                          ),
                        ),
                      ),
                    ),
                );
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: CastomButton(
                  onTap: () {}, text: "تواصل مع المعلن"),
            ),
          ),
        ]),
      ),
    );
  }

  Widget review(){
    return Column(
      children: [
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
                  color: Color(0xFF858585)),
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
              fontSize: 12,
              color: Color(0xFF858585)),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Divider(),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Container benefit({required String pros})=> Container(
        margin: const EdgeInsets.only(right: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0xAFF3EADA),
            borderRadius:
            BorderRadius.circular(20)),
        child:  Center(
            child: Text(
              "$pros",
              style: const TextStyle(
                color: Color(0xFF858585),
                fontSize: 12,
                fontFamily: 'Marhey',
              ),
            )));



}
