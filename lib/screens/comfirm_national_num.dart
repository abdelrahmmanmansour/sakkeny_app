import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/utils/select_image.dart';

class ComfirmNationalNum extends StatefulWidget {
  const ComfirmNationalNum({super.key});

  @override
  State<ComfirmNationalNum> createState() => _ComfirmNationalNumState();
}

class _ComfirmNationalNumState extends State<ComfirmNationalNum> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List imag = await pickImage(ImageSource.gallery);
    if (imag != null){
      _image = imag;

      Navigator.pushNamed(context, 'OtpVerification');

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'تأكيد الرقم القومي',
                    //textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF200E32),
                      fontSize: 16,
                      fontFamily: primFont,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'Login');
                    },
                    icon: const ImageIcon(
                      AssetImage("assets/images/Arrow - Right Square.png"),
                      color: orange,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'قم بادخال صورة بطاقة الرقم القومي احرص على وضوح البيانات',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF858585),
                  fontSize: 16,
                  fontFamily: primFont,
                  fontWeight: FontWeight.w300,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              IconButton(
                  onPressed: selectImage,
                  icon: const Icon(
                    Icons.add_photo_alternate_outlined,
                    color: Color(0xFFFF8C40),
                    size: 50,
                  )),
            ],
          ),
        ),
      ),
    );

  }
  Card buildButton({
    required onTap,
    required title,
    required text,
    required leadingImage,
  }) {
    return Card(
      shape: const StadiumBorder(),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            leadingImage,
          ),
        ),
        title: Text(title ?? ""),
        subtitle: Text(text ?? ""),
        trailing: const Icon(
          Icons.keyboard_arrow_right_rounded,
        ),
      ),
    );
  }
}
