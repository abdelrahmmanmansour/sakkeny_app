import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sakeny/CustomTextCubit/custom_text_cubit.dart';
import 'package:sakeny/SigInCubit/sig_in_cubit.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/screens/comfirm_national_num.dart';
import 'package:sakeny/tenant_screens/home.dart';

import '../castom/text_filed.dart';

class SignUp extends StatefulWidget {
  //SignUp({super.key});
  String id = "sign";
  bool isvible = false;
  bool isvible2 = false;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late bool checkBoxVale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: BlocConsumer<SigInCubit, SigInState>(
        listener: (context, state) {
          if (state is SuccessSignIn) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return ComfirmNationalNum();
              },
            ));
          } else if (state is ErrorSignIn) {
            Get.snackbar("خطأ", state.error);
          } else {
            const Center(child: CircularProgressIndicator());
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<SigInCubit>(context);
          return Form(
            key: cubit.formKeyRegister,
            child: ListView(
              children: [
                Center(
                  child: SizedBox(
                    width: 128,
                    height: 128,
                    child: Image.asset('assets/images/splash.png'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'مرحباً ! ادخل معلوماتك هنا',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF89ADA3),
                        fontSize: 18,
                        fontFamily: 'Marhey',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      child: Image.asset(
                        'assets/images/waving-hand 1.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CastomText(
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "من فضلك ادخل اسم المستخدم";
                    }
                    return null;
                  },
                  textEditingController: cubit.userNameController,
                  isvible: false,
                  hintText: 'اسم المستخدم',
                ),
                const SizedBox(
                  height: 10,
                ),
                CastomText(
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "من فضلك ادخل الرقم القومى  ";
                    }
                    return null;
                  },
                  textEditingController: cubit.userIdController,
                  isvible: false,
                  hintText: 'الرقم القومى',
                ),
                const SizedBox(
                  height: 20,
                ),
                CastomText(
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "من فضلك ادخل البريد الالكترونى ";
                    }
                    return null;
                  },
                  textEditingController: cubit.userEmailController,
                  isvible: false,
                  hintText: 'البريد الالكترونى',
                ),
                const SizedBox(
                  height: 20,
                ),
                CastomText(
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return " من فضلك ادخل اسم المستخد كاملا";
                    }
                    return null;
                  },
                  textEditingController: cubit.userFullName,
                  isvible: false,
                  hintText: 'اسم المستخدم كاملا',
                ),
                const SizedBox(
                  height: 20,
                ),
                CastomText(
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "من فضلك ادخل العنوان ";
                    }
                    return null;
                  },
                  textEditingController: cubit.userAddressController,
                  isvible: false,
                  onChange: (data) {},
                  hintText: 'العنوان  ',
                ),
                const SizedBox(
                  height: 20,
                ),
                CastomText(
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "من فضلك ادخل التخصص ";
                    }
                    return null;
                  },
                  textEditingController: cubit.userInfo,
                  isvible: false,
                  hintText: 'التخصص  ',
                ),
                const SizedBox(
                  height: 20,
                ),
                CastomText(
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "من فضلك ادخل العمر ";
                    }
                    return null;
                  },
                  textEditingController: cubit.userAgeController,
                  isvible: false,
                  hintText: 'العمر  ',
                ),
                const SizedBox(
                  height: 20,
                ),
                CastomText(
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "من فضلك ادخل كلمة المرور ";
                    }
                    return null;
                  },
                  textEditingController: cubit.userPassWord,
                  isvible: !widget.isvible,
                  hintText: 'كلمة المرور',
                  icon: IconButton(
                      color: Colors.black,
                      onPressed: () {
                        setState(() {
                          widget.isvible = !widget.isvible;
                        });
                      },
                      icon: widget.isvible
                          ? const Icon(
                              Icons.visibility_outlined,
                              color: Color(0xFF868686),
                            )
                          : const Icon(Icons.visibility_off_rounded,
                              color: Color(0xFF868686))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    addRadioButton(cubit.index = 0, cubit.female),
                    const SizedBox(
                      width: 8,
                    ),
                    addRadioButton(cubit.index = 1, cubit.male),
                    const Text(
                      ': النوع',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF868686),
                        fontSize: 12,
                        fontFamily: 'Marhey',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                        value: checkBoxVale,
                        activeColor: Color(0xFFFF8C40),
                        onChanged: (newVal) {
                          setState(() {
                            checkBoxVale = newVal!;
                          });
                        }),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Text(
                        'هل انت موافق على الشروط والاحكام؟',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 13,
                          fontFamily: 'Marhey',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
                CastomButton(
                  onTap: () {
                    if (cubit.formKeyRegister.currentState!.validate()) {
                      cubit.sigIn(
                          userAge: cubit.userAgeController.text,
                          userName: cubit.userNameController.text,
                          userPassword: cubit.userPassWord.text,
                          userFullName: cubit.userFullName.text,
                          userEmail: cubit.userEmailController.text,
                          userNatId: cubit.userIdController.text,
                          userGender: cubit.index==1?cubit.male:cubit.female,
                          userInfo: cubit.userInfo.text,
                          userAddress: cubit.userAddressController.text,
                          userAccountType: cubit.isKind?cubit.kind1:cubit.kind2);
                    }
                  },
                  text:state is LoadingCustom?"Loaded": "سجل الان",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'Login');
                      },
                      child: const Text(
                        "تسجيل دخول",
                        style: TextStyle(
                            color: Color(0xFFFF8C40),
                            fontSize: 13,
                            fontFamily: primFont,
                            fontWeight: FontWeight.w300,
                            height: 0),
                      ),
                    ),
                    const Text(
                      "هل لديك حساب بالفعل؟",
                      style: TextStyle(
                        color: Color(0xFF858585),
                        fontSize: 13,
                        fontFamily: primFont,
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    ));
  }

  late int gender = 1;

  Row addRadioButton(int butvalue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF868686),
            fontSize: 12,
            fontFamily: primFont,
            fontWeight: FontWeight.w300,
            height: 0,
          ),
        ),
        Radio(
            activeColor: Color(0xFFFF8C40),
            value: butvalue,
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value!;
              });
            }),
      ],
    );
  }
}
