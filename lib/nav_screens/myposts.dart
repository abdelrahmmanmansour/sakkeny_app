import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/Core/Constant/Constant.dart';
import 'package:sakeny/Core/Services/CachedHelper.dart';
import 'package:sakeny/PostData/GetPost/get_post_cubit.dart';
import 'package:sakeny/PostData/UpLoadData/upload_data_cubit.dart';
import 'package:sakeny/PostData/UpLoadData/upload_data_state.dart';
import 'package:sakeny/castom/mypost.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/screens/list.dart';
import 'package:sakeny/screens/view_post.dart';

class myposts extends StatefulWidget {
  myposts({super.key});

  @override
  State<myposts> createState() => _mypostsState();
}

class _mypostsState extends State<myposts> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
@override

  Widget build(BuildContext context) {

    var cubit = TestCubit.get(context);
    return Scaffold(

        drawer: Theme(
          data: Theme.of(context).copyWith(
            // Set the transparency here
            canvasColor: Colors.transparent,
          ),
          child: Container(
            width: double.infinity,
            child: const List(),
          ),
        ),
        key: _scaffoldKey,
        body: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: ListView(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 230),
                            child: Container(
                              width: 32,
                              height: 32,
                              child:
                                  Image.asset("assets/images/Group 36664.png"),
                            ),
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text(
                        "اعلاناتي",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            fontFamily: primFont,
                            height: 0.09,
                            letterSpacing: 0.20),
                      ),
                    ),
                  ],
                ),
                BlocConsumer<TestCubit, UploadDataState>(
                  listener: (context, state) {

                  },
                  builder: (context, state) {
                    return cubit.getDataList.isNotEmpty
                        ? ListView.builder(
                      itemCount: cubit.getDataList.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CastomMypost(
                          ontap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return ViewPost(
                                    getPostDataUser:
                                    cubit.getDataList[index]);
                              },
                            ));
                          },
                          image: cubit.getDataList[index].postPicTbls!
                              .isNotEmpty
                              ? cubit.getDataList[index].postPicTbls![0]
                              .pictureString
                              .toString()
                              : Constant.photo,
                          price: cubit.getDataList[index].postPriceAi!=null?cubit.getDataList[index].postPriceAi.toString():cubit.getDataList[index].postPriceDisplay.toString(),
                          location: "المنصورة ، حي الجامعة",
                          description:
                          " حمام ${cubit.getDataList[index].postBathrooms} غرف نوم ${cubit.getDataList[index].postArea}  ${cubit.getDataList[index].postBedrooms}",
                        );
                      },
                    )
                        : Center(
                        child: Column(
                          children: [
                            Image.asset("assets/images/onboarding one.png"),
                            const Text(
                              "من فضلك ادخل بيانات المنشور ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ));
                  },
                )
              ],
            )));
  }
}
