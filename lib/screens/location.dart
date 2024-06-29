import 'package:flutter/material.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/screens/google_maps.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: null,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
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
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  width: 138,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: Color(0xAFF3EADA),
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
                      // IconButton(
                      //   onPressed: () {
                      //    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //      return MapSample(
                      //
                      //      );
                      //    },));
                      //   },
                      //   icon: const Icon(
                      //     Icons.location_on,
                      //     color: orange,
                      //   ),
                      //   alignment: Alignment.topCenter,
                      // ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 317,
                height: 53,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.50, color: Color(0xFFD0D0D0)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: TextField(
                  textAlign: TextAlign.right,
                  onChanged: (data) {},
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.search_rounded,
                      color: orange,
                      size: 30,
                    ),
                    hintText: "الموقع",
                    hintStyle: TextStyle(
                      color: Color(0xFF858585),
                      fontSize: 16,
                      fontFamily: primFont,
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CastomButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: "التالى",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
