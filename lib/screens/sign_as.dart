import 'package:flutter/material.dart';
import 'package:sakeny/SigInCubit/sig_in_cubit.dart';
import 'package:sakeny/nav_screens/myposts.dart';
import 'package:sakeny/screens/sign_up.dart';
import 'package:sakeny/tenant_screens/home.dart';

class sign_as extends StatefulWidget {
  String id = 'sign_as';
  


  @override
  State<sign_as> createState() => _sign_asState();
}

class _sign_asState extends State<sign_as> {
  bool ?iskind;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 380,
            height: 380,
            child: Image.asset("assets/images/sign_as.png"),
          ),
          const SizedBox(
            height: 60,
          ),
          const Text(
            "تسجيل الدخول كـ",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: "Marhey",
                height: 0.07,
                letterSpacing: 0.20),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: double.infinity,
            height: 40.44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 160,
                  height: 40.44,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFdadada),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.50, color:Color(0xFF868686) ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                          SigInCubit.get(context).kind();
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context) {
                            return SignUp(
                               isKind: false,
                            );
                          },
                        ),(route) => false,);
                      },
                      child:  Text(
                        SigInCubit.get(context).kind1,
                        style: TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 14,
                          fontFamily: 'Marhey',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 160,
                  height: 40.44,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF89ada3),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.50, color: Color(0xFFd0d0d0)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {

                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context) {
                            return SignUp(
                              isKind: true,

                            );
                          },
                        ),(route) => false,);
                      },
                      child:  Text(
                      SigInCubit.get(context).kind2,
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 14,
                          fontFamily: 'Marhey',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
