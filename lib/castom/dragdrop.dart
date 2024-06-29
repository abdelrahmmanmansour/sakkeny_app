import 'package:flutter/material.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/costant.dart';

class Dragdrop extends StatelessWidget {
  const Dragdrop({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
              initialChildSize: 0.2,
              minChildSize: 0.1,
              maxChildSize: 0.25,
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
                              // Add more list tiles or widgets as needed
                            ],
                          ),
                        ),
                      ),
                    ));
              });
  }
}