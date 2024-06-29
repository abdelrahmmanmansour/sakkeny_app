import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../costant.dart';

class CastomText extends StatelessWidget {
  CastomText(
      {this.colorborder,
      this.hintText,
      this.radius,
      this.onChange,
        this.helpText,
      required this.isvible,
       @ required this.textEditingController,
        @required this.validator,
      @required this.icon});
  String? hintText;
  String? Function(String?)? validator;
  double? radius;
  bool isvible = false;
  Function(String)? onChange;
  Widget? icon;
  Color? colorborder;
  String ?helpText;
  TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

textDirection: TextDirection.rtl,
         validator:validator ,
      controller:textEditingController ,
      obscureText: isvible,
      textAlign: TextAlign.right,
      onChanged: onChange,

      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        helperStyle: const TextStyle(fontSize:14,fontWeight: FontWeight.bold,),
        helperText:helpText,
        prefixIcon: icon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF858585),
          fontSize: 12,
          fontFamily: primFont,
          fontWeight: FontWeight.w300,
          height: 0,
        ),
        enabledBorder:  OutlineInputBorder(
            borderSide:const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(20)
        ),
        errorBorder:  OutlineInputBorder(
            borderSide:const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(20)
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}

class Castomtext2 extends StatefulWidget {
  Castomtext2({super.key, this.isvible, this.onChange,required this.textEditingController});
  bool? isvible;
  Function(String)? onChange;
  TextEditingController textEditingController;
  @override
  State<Castomtext2> createState() => _Castomtext2State();
}

class _Castomtext2State extends State<Castomtext2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0xFFD0D0D0)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: TextFormField(
        controller: widget.textEditingController,
        maxLines: 3,
        obscureText: widget.isvible!,
        textAlign: TextAlign.right,
        onChanged: widget.onChange,
        style: const TextStyle(color: Colors.black),
        decoration: const InputDecoration(
          hintStyle: TextStyle(
            color: Color(0xFF858585),
            fontSize: 12,
            fontFamily: primFont,
            fontWeight: FontWeight.w300,
            height: 0,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
