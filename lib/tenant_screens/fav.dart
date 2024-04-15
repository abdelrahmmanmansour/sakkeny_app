import 'package:flutter/material.dart';
import 'package:sakeny/castom/fav_post.dart';
import 'package:sakeny/castom/tenant_post.dart';
import 'package:sakeny/costant.dart';

class Favouite extends StatelessWidget {
  const Favouite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'المفضلة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: primFont,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FavPost(
                      image: "assets/images/download (2).png",
                      price: '7000',
                      location: "المنصورة ، حي الجامعة",
                      description: " حمام 2 غرف نوم 2 150م",
                    ),
                    FavPost(
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
      ),
    );
  }
}
