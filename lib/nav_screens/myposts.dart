import 'package:flutter/material.dart';
import 'package:sakeny/castom/mypost.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/screens/list.dart';

class myposts extends StatelessWidget {
  myposts({super.key});
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
            child:List(),
          ),
        ),
        key: _scaffoldKey,
        body: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: ListView(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 230),
                          child: Container(
                            width: 32,
                            height: 32,
                            child: Image.asset("assets/images/Group 36664.png"),
                          ),
                        )),
                  ),
                 const Padding(
                    padding:  EdgeInsets.only(right: 15),
                    child:  Text(
                      "اعلاناتي",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          fontFamily: primFont,
                          height: 0.09,
                          letterSpacing: 0.20),
                    ),
                  ),
                 
                ],
              ),
              CastomMypost(
                image: "assets/images/download (2).png",
                price: '7000',
                location: "المنصورة ، حي الجامعة",
                description: " حمام 2 غرف نوم 2 150م",
              ),
              CastomMypost(
                image: "assets/images/download (2).png",
                price: '7000',
                location: "المنصورة ، حي الجامعة",
                description: " حمام 2 غرف نوم 2 150م",
              ),
              CastomMypost(
                image: "assets/images/download (2).png",
                price: '7000',
                location: "المنصورة ، حي الجامعة",
                description: " حمام 2 غرف نوم 2 150م",
              ),
            ],
          ),
        ));
  }
}
