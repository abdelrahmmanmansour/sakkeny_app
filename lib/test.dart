// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sakeny/CustomTextCubit/custom_text_cubit.dart';
// import 'package:sakeny/HomeCubit/UserDataCubit/user_data_cubit.dart';
//
// class CustomTest extends StatelessWidget {
//   CustomTest({Key? key}) : super(key: key);
//   String id = "CustomTest";
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("hello"),
//       ),
//       body: BlocBuilder<UserDataCubit, UserDataState>(
//
//         builder: (context, state) {
//          if(state is SuccessUserData){
//            return ListView(
//              children: [
//               Text("the data "),
//               Text(state.userModel.userInfo.toString()),
//              ],
//            );
//          }
//          return Center(child: Text("data null"));
//         },
//       ),
//     );
//   }
// }
