import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sakeny/HomeCubit/UserDataCubit/user_data_cubit.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/castom/text_filed.dart';
import 'package:sakeny/costant.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  String id = "EditProfile";

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController userInfo = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userAddressController = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController userFullName = TextEditingController();
  TextEditingController userGender = TextEditingController();
  TextEditingController userAccountType = TextEditingController();
  TextEditingController userAge = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 15,
                ),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      const Text(
                        '  تعديل الحساب',
                        //textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF200E32),
                          fontSize: 16,
                          fontFamily: primFont,
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
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
                    ]),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 125,
                      width: 145,
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage("assets/images/Avatars.png"),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () {},
                              icon: const ImageIcon(
                                AssetImage("assets/images/Edit.png"),
                                color: orange,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "السيره الذاتيه",
                          style: TextStyle(
                              fontFamily: primFont,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Castomtext2(
                      textEditingController: userInfo,
                      isvible: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "الاسم",
                          style: TextStyle(
                              fontFamily: primFont,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    CastomText(
                      textEditingController: userNameController,
                      isvible: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "البريد الالكترونى",
                          style: TextStyle(
                              fontFamily: primFont,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    CastomText(
                      textEditingController: userEmailController,
                      isvible: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "رقم الهاتف",
                          style: TextStyle(
                              fontFamily: primFont,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    CastomText(
                      textEditingController: userPhoneController,
                      isvible: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "العنوان",
                          style: TextStyle(
                              fontFamily: primFont,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    CastomText(
                      textEditingController: userAddressController,
                      isvible: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocConsumer<UserDataCubit, UserDataState>(
                      listener: (context, state) {
                        if (state is SuccessUpDateUser) {
                          Get.snackbar("success", "useful data");
                        } else if (state is ErrorUpdateUser) {
                          Get.snackbar("Erorr", state.error);
                        }
                      },
                      builder: (context, state) {
                        var data = UserDataCubit.get(context);
                        return CastomButton(
                          onTap: () {
                            data.upDateUserData(
                                    userName: userNameController.text,
                                    userPassword:data.userModel!.userPassword.toString(),

                                    userInfo:userInfo.text,
                                    userEmail: userEmailController.text,
                                    userPhone: userPhoneController.text,
                                    userAddress: userAddressController.text,
                                    userFullName: data.userModel!.userFullName.toString(),
                                    userAccountType:data.userModel!.userAccountType.toString() ,
                                    userAge:data.userModel!.userAge.toString() ,
                                    userGender:data.userModel!.userGender.toString(),);
                          },
                          text: state is LoadingUpDateUser
                              ? 'تحديث '
                              : 'حفظ التعديلات ',
                        );
                        //  MaterialButton(onPressed: () {
                        //
                        //
                        //   );
                        // },
                        // child: Text(""),
                        // );
                      },
                    )
                  ]),
                ))));
  }
}
