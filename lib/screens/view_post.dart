import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/Data/Model/GetPostDataUser.dart';
import 'package:sakeny/PostData/UpLoadData/upload_data_cubit.dart';
import 'package:sakeny/PostData/UpLoadData/upload_data_state.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/navigation_bar/navigation_bar.dart';
import 'package:sakeny/screens/UpdatePostScreen.dart';
import 'package:sakeny/screens/google_maps.dart';

class ViewPost extends StatelessWidget {
  ViewPost({super.key, required this.getPostDataUser});

  GetPostDataUser getPostDataUser;


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
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: ListView.separated(
                          itemCount: getPostDataUser.postPicTbls!.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 12,
                            );
                          },
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 4, right: 20, left: 20),
                              child: Container(
                                width: 331,
                                decoration: const BoxDecoration(),
                                child: Image.memory(
                                  base64Decode(getPostDataUser
                                      .postPicTbls![index].pictureString
                                      .toString()),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        ),
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
              initialChildSize: 0.2,
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
                                    height: 50,
                                    child:  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                         getPostDataUser.postOwnerName,
                                          style: const TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 12,
                                            fontFamily: 'Marhey',
                                            fontWeight: FontWeight.w300,
                                            height: 0,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const CircleAvatar(
                                          radius: 15,
                                          backgroundImage: AssetImage(
                                              "assets/images/ahme.png"),
                                        ),
                                        const SizedBox(
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
                                  text:  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: getPostDataUser.postPriceAi!=null?getPostDataUser.postPriceAi.toString():getPostDataUser.postPriceDisplay.toString(),
                                        style: const TextStyle(
                                          fontFamily: "Marhey",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          height: 2,
                                          color: Color(0xff3e3e3e),
                                        ),
                                      ),
                                      const TextSpan(
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
                               Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    " حمام ${getPostDataUser.postBathrooms} غرف نوم ${getPostDataUser.postArea}  ${getPostDataUser.postBedrooms}",
                                    style: const TextStyle(
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
                              Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width*.5,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xAFF3EADA),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Center(
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
                                           double v=double.parse(getPostDataUser.postLatitude!);
                                           double v2=double.parse(getPostDataUser.postLongitude!);

                                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                              return MapSample(
                                                n1: v,
                                                n2: v2,
                                              );
                                            },));
                                          },
                                          icon: const Icon(
                                            Icons.location_on,
                                            color: orange,
                                          ),
                                          alignment: Alignment.topCenter,
                                        ),
                                      ],
                                    ),
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

                              SizedBox(
                                height: 300,
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount:  getPostDataUser.features!.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 20,
                                    crossAxisCount: 3,
                                    mainAxisExtent: 40
                                  ),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: const Color(0xAFF3EADA),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          getPostDataUser.features![index].featuresName.toString().replaceAll("true", ""),
                                          style: const TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 12,
                                            fontFamily: 'Marhey',
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              const SizedBox(
                                height: 10,
                              ),

                              Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  BlocConsumer<TestCubit, UploadDataState>(
                                    listener: (context, state) {
                                      if (state is SuccessDeletePost) {
                                        Navigator.pushAndRemoveUntil(context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return const Nave();
                                              },
                                            ), (route) => false);
                                      }
                                    },
                                    builder: (context, state) {
                                      return Expanded(
                                        child: CastomButton(
                                            onTap: () {
                                              TestCubit.get(context).deletePost(
                                                  getPostDataUser.postId!);
                                            },
                                            text: "مسح"),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: CastomButton(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return UpDatePostScreen(
                                                    getPostDataUser:
                                                    getPostDataUser,
                                                  );
                                                },
                                              ));
                                        },
                                        text: "تعديل"),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              // Add more list tiles or widgets as needed
                            ],
                          ),
                        ),
                      ),
                    ));
              }),
        ]),
      ),
    );
  }

  Widget Features() {
    return MaterialButton(
      color: const Color(0xAFF3EADA),
      onPressed: () {},
      height: 25,
      minWidth: 1,
      padding: const EdgeInsets.all(10),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
      child: const Text(
        "hello_cssccscsc",
        style: TextStyle(
          color: Color(0xFF858585),
          fontSize: 12,
          fontFamily: 'Marhey',
        ),
      ),
    );
  }
}
