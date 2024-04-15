import 'package:flutter/material.dart';
import 'package:sakeny/tenant_screens/list.dart';

import '../castom/tenant_post.dart';
import '../costant.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Theme(
        data: Theme.of(context).copyWith(
          // Set the transparency here
          canvasColor: Colors.transparent,
        ),
        child: Container(
          width: double.infinity,
          child:const List1(),
        ),
      ),
      key: _scaffoldKey,
      body: Column(

        children: [
          Container(
            color: const Color(0xFF89ADA3),
            child: Column(

              children: [
                Stack(
                  children: [
                     const Image(image: AssetImage("assets/images/up.png")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            child: Container(
                              margin: const EdgeInsets.only(top: 50),
                              width: 32,
                              height: 32,
                              child: Image.asset("assets/images/list.png"),
                            )),
                      ],
                    ),

                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.only(top:9),
                  height: 53,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.50, color: Color(0xFFD0D0D0)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: TextField(
                    textAlign: TextAlign.right,
                    onTap: (){
                      Navigator.pushNamed(context, "search");
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration:  InputDecoration(
                      suffixIcon: IconButton(
                        padding: const EdgeInsets.only(bottom: 7),
                        onPressed: (){},
                        icon: const Icon(

                          Icons.search_rounded,
                          color: orange,
                          size: 25,
                        ),),
                      hintText: "ابحث عن حي ، شارع ، اشخاص",
                      hintStyle: const TextStyle(

                        color:  Color(0x8e808080),
                        fontSize: 13,
                        fontFamily: primFont,
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const Image(image: AssetImage("assets/images/down.png")),
              ],
            ),
          ),
          const SizedBox(height: 17,),
          const Padding(
            padding: EdgeInsets.only(right: 15,bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                   Text(
                     'تصفح الاقتراحات',
                     textAlign:  TextAlign.center,
                     style:  TextStyle (
                      fontFamily: primFont,
                       fontSize:  16,
                       fontWeight:  FontWeight.w800,
                       color:  Color(0xff000000),
                     ),
                   ),


              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Post(
                  image: "assets/images/download (2).png",
                  price: '7000',
                  location: "المنصورة ، حي الجامعة",
                  description: " حمام 2 غرف نوم 2 150م",
                ),
                  Post(
                    image: "assets/images/download (2).png",
                    price: '7000',
                    location: "المنصورة ، حي الجامعة",
                    description: " حمام 2 غرف نوم 2 150م",
                  ),
                ],
              ),

            ),
          )
        ],
      ),

    );
  }
}
