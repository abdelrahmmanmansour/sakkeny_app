import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeny/Core/Constant/Constant.dart';
import 'package:sakeny/PostData/GetPost/get_post_cubit.dart';
import 'package:sakeny/castom/tenant_post.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/tenant_screens/list.dart';
import 'package:sakeny/tenant_screens/search.dart';
import 'package:sakeny/tenant_screens/tenant_view_post.dart';



class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Theme(
        data: Theme.of(context).copyWith(
          // Set the transparency here
          canvasColor: Colors.transparent,
        ),
        child: Container(
          width: double.infinity,
          child: const List1(),
        ),
      ),
      key: _scaffoldKey,
      body: BlocConsumer<GetPostCubit, GetPostState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubitGetPostSuggest = GetPostCubit.get(context);
          return ListView(
            children: [
              Container(
                color: const Color(0xFF89ADA3),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const Image(image: AssetImage("assets/images/up.png")),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero),
                                child: Container(
                                  margin: const EdgeInsets.only(top: 50),
                                  width: 32,
                                  height: 32,
                                  child: Image.asset("assets/images/list.png"),
                                )),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const Search();
                        },));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.only(top: 9),
                        height: 53,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: Color(0xFFD0D0D0)),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: TextFormField(

                          style: const TextStyle(color: Colors.black),
                          enabled: false,
                          decoration:  InputDecoration(
                            suffixIcon: IconButton(
                              padding: const EdgeInsets.only(bottom: 7),
                              onPressed: (){

                              },
                              icon: const Icon(

                                Icons.search_rounded,
                                color: orange,
                                size: 25,
                              ),),
                            hintStyle: const TextStyle(

                              color:  Color(0x8e808080),
                              fontSize: 13,
                              fontFamily: primFont,
                              fontWeight: FontWeight.w300,
                              height: 0,
                            ),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        // child: TextFormField(
                        //   style: const TextStyle(color: Colors.black),
                        //   textAlign: TextAlign.right,
                        //   onChanged: (value) {
                        //     // cubitGetPostSuggest.searchPost(value);
                        //   },
                        //
                        //   decoration: const InputDecoration(
                        //     hintText: "ابحث عن حي ، شارع ، اشخاص",
                        //     hintStyle: TextStyle(
                        //       color: Color(0x8e808080),
                        //       fontSize: 13,
                        //       fontFamily: primFont,
                        //       fontWeight: FontWeight.w300,
                        //       height: 0,
                        //     ),
                        //     suffixIcon: Icon(
                        //       //
                        //       Icons.search_rounded,
                        //       color: orange,
                        //       size: 25,
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                    const Image(image: AssetImage("assets/images/down.png")),
                  ],
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 15, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'تصفح الاقتراحات',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: primFont,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              state is LoadingGetUserSuggest?const Center(child: CircularProgressIndicator(),): cubitGetPostSuggest.getAllPost.isEmpty? Center(
                  child: Column(
                    children: [
                      Image.asset("assets/images/onboarding one.png"),
                      const Text(
                        "....لا يوجد نتائج متاحه الان",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  )):   ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return  Post(
                      nameText: cubitGetPostSuggest.getAllPost[index].postOwnerName.toString(),
                      ontap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return TenantViewPost(getPostDataUser: cubitGetPostSuggest.getAllPost[index]);
                        },));
                      },
                      colorFavorite: cubitGetPostSuggest.getAllPost[index].isFavourited==true?Colors.red:Colors.grey,
                      onPress: () {
                        cubitGetPostSuggest.favorite(cubitGetPostSuggest.getAllPost[index].postId!.toInt());
                        GetPostCubit.get(context).getDataSuggest();


                      },
                      // image: Constant.photo,
                      image:cubitGetPostSuggest.getAllPost[index].postPicTbls?[0]!=null?cubitGetPostSuggest.getAllPost[index].postPicTbls![0].pictureString.toString():Constant.photo2,
                      // image: "assets/images/onboarding one.png",
                      price: cubitGetPostSuggest.searchAllPost.isEmpty
                          ? cubitGetPostSuggest
                          .getAllPost[index].postPriceDisplay
                          .toString()
                          : cubitGetPostSuggest
                          .searchAllPost[index].postPriceDisplay
                          .toString(),
                      location: "المنصورة ، حي الجامعة",
                      description:
                      " حمام ${cubitGetPostSuggest.searchAllPost.isEmpty ? cubitGetPostSuggest.getAllPost[index].postBathrooms : cubitGetPostSuggest.searchAllPost[index].postBathrooms} غرف نوم 2 150م",
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10.h,
                    );
                  },
                  itemCount: cubitGetPostSuggest.getAllPost.length)
            ],
          );
        },
      ),
    );
  }
}
