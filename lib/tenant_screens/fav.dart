import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/PostData/GetPost/get_post_cubit.dart';
import 'package:sakeny/castom/fav_post.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/tenant_screens/tenant_view_post.dart';

class Favouite extends StatelessWidget {
  const Favouite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'المفضلة',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: primFont,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //
              //         FavPost(
              //           image: "assets/images/download (2).png",
              //           price: '7000',
              //           location: "المنصورة ، حي الجامعة",
              //           description: " حمام 2 غرف نوم 2 150م",
              //         ),
              //       ],
              //     ),
              //   ),
              // )
              BlocConsumer<GetPostCubit, GetPostState>(
                listener: (context, state) {
                  if (state is SuccessDelete) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("تم الحذف بنجاح"),
                      backgroundColor: Colors.greenAccent,
                    ));
                  } else {
                    const Center(
                        child: CupertinoActivityIndicator(
                      color: Colors.green,
                    ));
                  }
                },
                builder: (context, state) {
                  var cubit = GetPostCubit.get(context);
                  return state is LoadingDelete
                      ? const Center(child: CircularProgressIndicator())
                      : cubit.getAllFavorite.isEmpty
                          ? Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * .4),
                              child: const Center(
                                child: Text(
                                  textDirection: TextDirection.rtl,
                                  "قائمة المفضلات فارغة. استكشف وأضف منتجات تحبها هنا! ❤️",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : SizedBox(
                              height: MediaQuery.of(context).size.height * .84,
                              child: ListView.builder(
                                itemCount: cubit.getAllFavorite.length,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return FavPost(
                                    ontap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return TenantViewPost(
                                              getPostDataUser:
                                                  cubit.getAllFavorite[index]);
                                        },
                                      ));
                                      GetPostCubit.get(context).getDataSuggest();
                                    },
                                    color: Colors.orange,
                                    onPress: () {
                                      cubit.deleteFavorite(cubit
                                          .getAllFavorite[index].postId!
                                          .toInt());
                                      // GetPostCubit.get(context).getDataSuggest();
                                    },
                                    image: cubit.getAllFavorite[index]
                                        .postPicTbls![0].pictureString
                                        .toString(),
                                    price: '7000',
                                    location: "المنصورة ، حي الجامعة",
                                    description:
                                        " حمام ${cubit.getAllFavorite[index].postBathrooms} غرف نوم ${cubit.getAllFavorite[index].postBedrooms} 150م",
                                  );
                                },
                              ),
                            );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
