import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakeny/PostData/UpLoadData/upload_data_cubit.dart';
import 'package:sakeny/PostData/UpLoadData/upload_data_state.dart';

import 'package:sakeny/castom/button.dart';
import 'package:sakeny/checkbox_state/checkbox_state.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/navigation_bar/navigation_bar.dart';
import 'package:sakeny/post_details_screens/benefits_and_secvises.dart';
import 'package:sakeny/screens/location.dart';
import 'package:sakeny/screens/suggest%20apractice.dart';
import 'package:sakeny/utils/select_image.dart';

class Post extends StatefulWidget {
  Post({super.key, required this.value, required this.data});

  bool value;
  String data;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List imag = await pickImage(ImageSource.gallery);
    if (imag != null) {
      _image = imag;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TestCubit, UploadDataState>(
        listener: (context, state) {
          if (state is SuccessUpload) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return Nave();
              },
            ));
          }
        },
        builder: (context, state) {
          var Cubit = TestCubit.get(context);
          return SafeArea(
              child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
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
              const Padding(
                padding: EdgeInsets.only(right: 15, top: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'قم بتحميل حتى 20 صورة',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Marhey',
                      fontWeight: FontWeight.w300,
                      height: 0.09,
                      letterSpacing: 0.20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 380,
                    height: 138,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFF89ADA3)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            TestCubit.get(context).getImageAsString();
                          },
                          icon: const Icon(
                            Icons.add_photo_alternate_outlined,
                            color: Color(0xFFFF8C40),
                            size: 50,
                          )),
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return BenefitsAndSecrvises();
                        },
                      ));
                    },
                    icon: ImageIcon(
                      AssetImage("assets/icons/Arrow - Left.png"),
                      color: orange,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: const Text(
                      'المزايا والخدمات ',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Marhey',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Divider(
                  thickness: 1.5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Location();
                        },
                      ));
                    },
                    icon: ImageIcon(
                      AssetImage("assets/icons/Arrow - Left.png"),
                      color: orange,
                      size: 30,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: const Text(
                          ' الموقع ',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Marhey',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          'المنصورة , حي الجامعة',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFF858585),
                            fontSize: 12,
                            fontFamily: 'Marhey',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Divider(
                  thickness: 1.5,
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: CastomButton(
                    onTap: () {
                      TestCubit.get(context).postData(
                          Cubit.images,
                          [CheckBoxState(title: "hello")],
                          int.parse(Cubit.PostArea.text),
                          int.parse(Cubit.PostKitchens.text),
                          int.parse(Cubit.PostBedrooms.text),
                     widget.value,
                          int.parse(Cubit.PostBathrooms.text),
                          "widget.data");
                      Cubit.PostArea.clear();
                      Cubit.PostKitchens.clear();
                      Cubit.PostBedrooms.clear();
                      Cubit.PostBathrooms.clear();
                    },
                    text: "اقتراح السعر"),
              )
            ],
          ));
        },
      ),
    );
  }
}
