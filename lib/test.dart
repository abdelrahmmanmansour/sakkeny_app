import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/CustomTextCubit/custom_text_cubit.dart';
import 'package:sakeny/HomeCubit/UserDataCubit/user_data_cubit.dart';

class CustomTest extends StatelessWidget {
  CustomTest({Key? key}) : super(key: key);
  String id = "CustomTest";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body:Column(
        children: [

        ],
      )
    );
  }
}
