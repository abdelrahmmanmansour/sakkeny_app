import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/Data/Model/GetPostDataUser.dart';
import 'package:sakeny/PostData/UpLoadData/upload_data_cubit.dart';
import 'package:sakeny/PostData/UpLoadData/upload_data_state.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/castom/text_filed.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/navigation_bar/navigation_bar.dart';

class UpDatePostScreen extends StatefulWidget {
  UpDatePostScreen({super.key, required this.getPostDataUser});

  GetPostDataUser getPostDataUser;

  @override
  State<UpDatePostScreen> createState() => _Abdo1State();
}

class _Abdo1State extends State<UpDatePostScreen> {
  bool isCheck = false;
  bool isvible = false;
  String value = 'حدد نوع العقار';
  String value1 = "غرفة";
  String value2 = "استديو";
  String value3 = "شقة";
  String value4 = "دوبلكس";
  TextEditingController area = TextEditingController();
  TextEditingController bedRoom = TextEditingController();

  TextEditingController bathRoom = TextEditingController();
  TextEditingController kitchenRoom = TextEditingController();
  GlobalKey<FormState> formKeyUpDate = GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_forward_ios)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0x99F3EADA),
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
                          style: const TextStyle(
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
                        textEditingController: area,
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
                        textEditingController: bedRoom,
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
                        textEditingController: bathRoom,
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
                        textEditingController: kitchenRoom,
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
                                      ? const Color(0x3F808080)
                                      : Colors.white),
                              child: const Center(
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
                          const SizedBox(
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
                                      ? const Color(0x3F808080)
                                      : Colors.white),
                              child: const Center(
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
                          const SizedBox(
                            width: 45,
                          ),
                          const Text(
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
                    BlocConsumer<TestCubit, UploadDataState>(
                      listener: (context, state) {
                        if (state is SuccessUpDatePost) {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                            builder: (context) {
                              return const Nave();
                            },
                          ), (route) => false);
                        }
                      },
                      builder: (context, state) {
                        List<String> imageStrings = widget
                            .getPostDataUser.postPicTbls!
                            .map((item) => item.pictureString.toString())
                            .toList();
                        List<String> featuresString = widget
                            .getPostDataUser.features!
                            .map((item) => item.featuresName.toString())
                            .toList();
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CastomButton(onTap: () {
                            TestCubit.get(context).updatePost(
                                images: imageStrings,
                                id: widget.getPostDataUser.postId!.toInt(),
                                postArea: area.text.isEmpty?widget.getPostDataUser.postArea.toString():area.text,
                                postBathRooms: bathRoom.text.isEmpty?widget.getPostDataUser.postArea.toString():bathRoom.text,
                                postBedRooms: bedRoom.text.isEmpty?widget.getPostDataUser.postArea.toString():bedRoom.text,
                                PostCategory: value.isEmpty?widget.getPostDataUser.postCategory.toString():value,
                                postKitchen: kitchenRoom.text.isEmpty?widget.getPostDataUser.postCategory.toString():kitchenRoom.text,
                                postLookSea: isCheck ?? widget.getPostDataUser.postLookSea!,
                            feature: featuresString
                            );
                          }, text:state is LoadingUpDatePost?"تحميل البيانات...": "تعديل "),
                        );
                      },
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
                            isvible = false;
                          },
                          text: value1,
                        ),
                        CastomButton2(
                          onTap: () {
                            setState(() {
                              value = value2;
                            });
                            isvible = false;
                          },
                          text: value2,
                        ),
                        CastomButton2(
                          onTap: () {
                            setState(() {
                              value = value3;
                            });
                            isvible = false;
                          },
                          text: value3,
                        ),
                        CastomButton2(
                          onTap: () {
                            setState(() {
                              value = value4;
                            });
                            isvible = false;
                          },
                          text: value4,
                        )
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
