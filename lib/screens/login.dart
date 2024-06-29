import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sakeny/Core/Services/CachedHelper.dart';
import 'package:sakeny/SigInCubit/sig_in_cubit.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/castom/text_filed.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/navigation_bar/nav_bar_tenant.dart';
import 'package:sakeny/navigation_bar/navigation_bar.dart';
import 'package:sakeny/screens/sign_as.dart';
import 'package:sakeny/screens/sign_up.dart';
import 'package:sakeny/tenant_screens/home.dart';

class Login extends StatefulWidget {
  Login({super.key});

  bool isvible = false;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var cubit = SigInCubit.get(context);

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: BlocConsumer<SigInCubit, SigInState>(
        listener: (context, state) {
          if (state is SuccessLogIn) {
            CacheHelper.getData(key: "userAccountType") == "مستأجر"
                ? Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return NaveTenant();

                    },
                  ),(route) => false,)
                : Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return const Nave();
                    },
                  ),(route) => false,);
            cubit.emailController.clear();
            cubit.passWordController.clear();
          } else if (state is ErrorLogIn) {
            Get.snackbar("خطأ", state.error);
          } else {
            const Center(child: CircularProgressIndicator());
          }
        },
        builder: (context, state) {
          return Form(
            key: cubit.formKeyLogIn0,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 40),
                  child: Center(
                    child: SizedBox(
                      width: 128,
                      height: 128,
                      child: Image.asset('assets/images/splash.png'),
                    ),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'مرحباً ! قم بالتسجيل للدخول الي حسابك',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF89ADA3),
                        fontSize: 18,
                        fontFamily: 'Marhey',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                CastomText(
                  textEditingController: cubit.emailController,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "من فضلك ادخل البريد الالكترونى  ";
                    }
                    return null;
                  },
                  isvible: false,
                  onChange: (data) {},
                  hintText: 'البريد الالكترونى',
                ),
                const SizedBox(
                  height: 40,
                ),
                CastomText(
                  textEditingController: cubit.passWordController,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "من فضلك كلمة المرور   ";
                    }
                    return null;
                  },
                  isvible: !widget.isvible,
                  onChange: (data) {},
                  hintText: 'كلمة المرور',
                  icon: IconButton(
                      color: Colors.black,
                      onPressed: () {
                        setState(() {
                          widget.isvible = !widget.isvible;
                        });
                      },
                      icon: widget.isvible
                          ? const Icon(Icons.visibility_outlined,
                              color: Color(0xFF868686))
                          : const Icon(Icons.visibility_off_rounded,
                              color: Color(0xFF868686))),
                ),
                const SizedBox(
                  height: 40,
                ),
                CastomButton(
                  onTap: () {
                    if (cubit.formKeyLogIn0.currentState!.validate()) {
                      cubit.logIn(
                          userMail: cubit.emailController.text,
                          password: cubit.passWordController.text);
                    }
                  },
                  text: "تسجيل الدخول",
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context) {
                            return sign_as();
                          },
                        ),(route) => false,);
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
                      "لا يوجد لديك حساب؟",
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
}
