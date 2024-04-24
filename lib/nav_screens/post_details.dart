import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/PostData/UpLoadData/upload_data_cubit.dart';
import 'package:sakeny/PostData/UpLoadData/upload_data_state.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/castom/text_filed.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/nav_screens/myposts.dart';
import 'package:sakeny/screens/postdetails1.dart';

class post_details extends StatefulWidget {
  post_details({super.key});

  @override
  State<post_details> createState() => _Abdo1State();
}

class _Abdo1State extends State<post_details> {
  bool isCheck = false;
  bool isvible = false;
  String value = 'حدد نوع العقار';
  String value1 = "غرفة";
  String value2 = "استديو";
  String value3 = "شقة";
  String value4 = "دوبلكس";
GlobalKey <FormState> formKey=GlobalKey();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
         key: formKey,
        child: SafeArea(
          child: BlocConsumer<TestCubit, UploadDataState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit = TestCubit.get(context);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x99F3EADA),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isvible = !isvible;
                                });
                              },
                              icon: const ImageIcon(
                                AssetImage("assets/icons/Arrow - Down 2.png"),
                                color: orange,
                                size: 30,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  value,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF89ADA3),
                                    fontSize: 16,
                                    fontFamily: 'Marhey',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: CastomText(
                                colorborder: Colors.blueGrey,
                                textEditingController: cubit.PostArea,
                                validator: (p0) {
                                  if (p0!.isEmpty) {
                                    return "من فضلك ادخل  أدخل المساحة ";
                                  }
                                  return null;
                                },
                                isvible: false,
                                onChange: (data) {},
                                hintText: ' أدخل المساحة ',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: CastomText(
                                colorborder: Colors.blueGrey,
                                textEditingController: cubit.PostBedrooms,
                                validator: (p0) {
                                  if (p0!.isEmpty) {
                                    return "من فضلك ادخل  عدد غرف النوم ";
                                  }
                                  return null;
                                },
                                isvible: false,
                                onChange: (data) {},
                                hintText: '  عدد غرف النوم',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: CastomText(
                                colorborder: Colors.blueGrey,
                                textEditingController: cubit.PostBathrooms,
                                validator: (p0) {
                                  if (p0!.isEmpty) {
                                    return "من فضلك ادخل  عدد الحمامات  ";
                                  }
                                  return null;
                                },
                                isvible: false,
                                onChange: (data) {},
                                hintText: ' عدد الحمامات  ',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: CastomText(
                                textEditingController: cubit.PostKitchens,
                                colorborder: Colors.blueGrey,
                                isvible: false,
                                validator: (p0) {
                                  if (p0!.isEmpty) {
                                    return "من فضلك ادخل  عدد المطابخ   ";
                                  }
                                  return null;
                                },
                                onChange: (data) {},
                                hintText: 'عدد المطابخ  ',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isCheck = !isCheck;
                                      });
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: isCheck
                                                  ? Colors.grey
                                                  : Colors.orangeAccent),
                                          borderRadius: BorderRadius.circular(20),
                                          color: isCheck
                                              ? Color(0x3F808080)
                                              : Colors.white),
                                      child: Center(
                                          child: Text(
                                        'لا',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF858585),
                                          fontSize: 12,
                                          fontFamily: 'Marhey',
                                          fontWeight: FontWeight.w300,
                                          height: 0,
                                        ),
                                      )),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isCheck = !isCheck;
                                      });
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: !isCheck
                                                  ? Colors.grey
                                                  : Colors.orangeAccent),
                                          borderRadius: BorderRadius.circular(20),
                                          color: !isCheck
                                              ? Color(0x3F808080)
                                              : Colors.white),
                                      child: Center(
                                        child: Text(
                                          'نعم',
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
                                  ),
                                  SizedBox(
                                    width: 45,
                                  ),
                                  Text(
                                    'تطل على البحر',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Marhey',
                                      fontWeight: FontWeight.w300,
                                      height: 0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(10),
                            //   child: Castomtext2(
                            //     isvible: false,
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: CastomButton(
                                  onTap: () {
                                   if(formKey.currentState!.validate()){
                                     Navigator.push(context, MaterialPageRoute(
                                       builder: (context) {
                                         return Post(
                                           data: value,
                                           value: isCheck,
                                         );
                                       },
                                     ));
                                   }
                                  },
                                  text: "التالى"),
                            ),
                          ],
                        ),
                        Visibility(
                            visible: isvible,
                            child: Column(
                              children: [
                                CastomButton2(
                                  onTap: () {
                                    setState(() {
                                      value = value1;
                                    });
                                  },
                                  text: value1,
                                ),
                                CastomButton2(
                                  onTap: () {
                                    setState(() {
                                      value = value2;
                                    });
                                  },
                                  text: value2,
                                ),
                                CastomButton2(
                                  onTap: () {
                                    setState(() {
                                      value = value3;
                                    });
                                  },
                                  text: value3,
                                ),
                                CastomButton2(
                                  onTap: () {
                                    setState(() {
                                      value = value4;
                                    });
                                  },
                                  text: value4,
                                )
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
