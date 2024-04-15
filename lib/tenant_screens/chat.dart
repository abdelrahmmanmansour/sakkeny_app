import 'package:flutter/material.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/profile.dart/profile.dart';
import 'package:sakeny/tenant_screens/profile.dart';

class Chat1 extends StatelessWidget {
  const Chat1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor:  const Color(0x99F3EADA),
          elevation: 0,
          leading: Builder(
            builder: (BuildContext cotext){
              return IconButton(onPressed: (){

              },
                  icon: const Icon(Icons.phone_rounded,
                    color: orange,size: 30,));
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: ' أحمد طارق\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Marhey',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'اخر ظهور منذ 2 د',
                      style: TextStyle(
                        color: Color(0xFF858585),
                        fontSize: 12,
                        fontFamily: 'Marhey',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(width: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Profile1();
                  },));
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/Avatars.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90),
                    ),
                  ),
                ),
              ),


            ],
          ),
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
                  size: 33,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20,bottom: 20,left: 10),
              padding: const EdgeInsets.only(left: 7,top: 10),
              width: 150,
              height: 65,
              decoration: const BoxDecoration(
                color: Color(0xFFF4F3F2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'مرحبا انا مهتم بهذا الاعلان ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Marhey',
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                    ),
                  ),
                  const SizedBox(height: 19,),

                  Text(
                    '3:02 am',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4000000059604645),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20,horizontal: 25),
              width: double.infinity,
              height: 46,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.50, color: Color(0xFFD0D0D0)),
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              child: TextField(
                textAlign: TextAlign.right,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  prefixIcon:Container(
                    width: 98,
                    child: Row(
                      children: [
                        IconButton(onPressed: (){}
                          ,icon:Icon(Icons.keyboard_voice_rounded,color: orange,size: 30,) ,),
                        IconButton(onPressed: (){}
                          ,icon:Icon(Icons.camera_alt_rounded,color: orange,size: 25,) ,),

                      ],
                    ),
                  ),
                  hintText:"اكتب رسالتك هنا" ,
                  hintStyle: const TextStyle(
                    color: Color(0xFF858585),
                    fontSize: 12,
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
            )

          ],
        )
    );
  }
}
