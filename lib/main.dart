import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sakeny/Core/Constant/BlocObserve.dart';
import 'package:sakeny/Core/Constant/ServicesLocator.dart';
import 'package:sakeny/Core/Services/ApiServices.dart';
import 'package:sakeny/Core/Services/CachedHelper.dart';
import 'package:sakeny/CustomTextCubit/custom_text_cubit.dart';
import 'package:sakeny/Data/Repo/HomeRepoImplementation.dart';
import 'package:sakeny/HomeCubit/UserDataCubit/user_data_cubit.dart';
import 'package:sakeny/SigInCubit/sig_in_cubit.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/nav_screens/chat.dart';
import 'package:sakeny/nav_screens/chat_box.dart';
import 'package:sakeny/nav_screens/myposts.dart';
import 'package:sakeny/nav_screens/notification.dart';
import 'package:sakeny/nav_screens/post_details.dart';
import 'package:sakeny/navigation_bar/nav_bar_tenant.dart';
import 'package:sakeny/navigation_bar/navigation_bar.dart';
import 'package:sakeny/post_details_screens/benefits_and_secvises.dart';
import 'package:sakeny/profile.dart/edit_profile.dart';
import 'package:sakeny/profile.dart/profile.dart';
import 'package:sakeny/screens/comfirm_national_num.dart';
import 'package:sakeny/screens/google_maps.dart';
import 'package:sakeny/screens/list.dart';
import 'package:sakeny/screens/location.dart';
import 'package:sakeny/screens/login.dart';
import 'package:sakeny/screens/onboardingbody.dart';
import 'package:sakeny/screens/otp_verificatin_screen.dart';
import 'package:sakeny/screens/postdetails1.dart';
import 'package:sakeny/screens/sign_as.dart';
import 'package:sakeny/screens/sign_up.dart';
import 'package:sakeny/screens/splash_screen.dart';
import 'package:sakeny/screens/suggest%20apractice.dart';
import 'package:sakeny/screens/view_post.dart';
import 'package:sakeny/tenant_screens/home.dart';
import 'package:sakeny/tenant_screens/search.dart';
import 'package:sakeny/tenant_screens/tenant_view_post.dart';
import 'package:sakeny/test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  ServicesLocator.setupServiceLocator();
  id= CacheHelper.getData(key: "id");
print("the id is ${CacheHelper.getData(key: "id")}");
// print("id ${id!.toInt()}");
  runApp(SakenyApp());
}

class SakenyApp extends StatelessWidget {
  const SakenyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SigInCubit(ServicesLocator.getIt.get<HomeRepoImplementation>()),
        ),
        BlocProvider(
          create: (context) =>
              UserDataCubit(ServicesLocator.getIt.get<HomeRepoImplementation>())..getUserData(),
        )

      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,

        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              "nav_tenant": (context) => NaveTenant(),
              "EditProfile": (context) => EditProfile(),
              "postdetail": (context) => post_details(),
              "notifi": (context) => NotificationScreen(),
              "chatBox": (context) => ChatBox(),
              "chat": (context) => Chat(),
              "suggestpractice": (context) => suggestpractice(),
              "viewpost": (context) => ViewPost(),
              'location': (context) => Location(),
              "benefit": (context) => BenefitsAndSecrvises(),
              'nav': (context) => Nave(),
              'OtpVerification': (context) => OtpVerification(),
              SignUp().id: (context) => SignUp(),
              sign_as().id: (context) => sign_as(),
              CustomTest().id: (context) => CustomTest(),
              'Login': (context) => Login(),
              'comfirm': (context) => ComfirmNationalNum(),
              'suggest': (context) => suggestpractice(),
              'splash': (context) => splashscreen(),
              'one': (context) => OnboardingScreen(),
              'map': (context) => MapSample(),
              'profile': (context) => EditProfile(),
              'list': (context) => List(),
              'p1': (context) => Profile(),
              "mypost": (context) => myposts(),
              "p2": (context) => Post(),
              "home": (context) => Home(),
              "tenant_view_post": (context) => TenantViewPost(),
              "search": (context) => Search()
            },
            initialRoute:id!=null?"Login": 'splash',
          );
        },
      ),
    );
  }
}
