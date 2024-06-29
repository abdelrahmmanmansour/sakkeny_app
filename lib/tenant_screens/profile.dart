import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sakeny/Data/Model/UserModel.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/tenant_screens/FeedBackUser/feed_back_user_cubit.dart';
import 'package:sakeny/tenant_screens/PersonInformation/person_information_cubit.dart';

class Profile1 extends StatefulWidget {
  Profile1({super.key, required this.userModel});
  UserModel userModel;

  @override
  State<Profile1> createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  TextEditingController writeController = TextEditingController();

  @override
  void initState() {
    FeedBackUserCubit.get(context)
        .getFeedBack(name: widget.userModel.userName.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 15,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const ImageIcon(
                            AssetImage("assets/images/Arrow - Right Square.png"),
                            color: orange,
                            size: 30,
                          ),
                        ),
                      ),
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/images/Avatars.png"),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                       Text(
                        widget.userModel.userFullName.toString(),
                        style: TextStyle(
                            fontFamily: primFont,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              "4.8",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: primFont,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "assets/images/Star.png",
                                width: 20,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "السيرة الذاتية",
                          style: TextStyle(
                              fontFamily: primFont,
                              fontSize: 16,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          textDirection: TextDirection.rtl,
                          "  دكتور صيدلى من المنصورة أعيش فى الكويت 45 سنة",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: primFont,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: Divider(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          " التعلقات والمراجعات",
                          style: TextStyle(
                              fontFamily: primFont,
                              fontSize: 16,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextForm(
                        writeController,
                            () {
                          FeedBackUserCubit.get(context).postFeedBack(
                              messages: writeController.text,
                              name: widget.userModel.userName.toString());
                          FocusScope.of(context).unfocus();
                          writeController.clear();
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: BlocConsumer<FeedBackUserCubit, FeedBackUserState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit = FeedBackUserCubit.get(context);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  itemCount: cubit.getFeedBackUser.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return comment(
                      cubit.getFeedBackUser[index].userFeedback?.feedbackFrom !=
                          null
                          ? cubit.getFeedBackUser[index].userFeedback!.feedbackFrom
                          .toString()
                          : "",
                      cubit.getFeedBackUser[index].userFeedback!.feedbackDate
                          .toString()
                          .replaceAll("T00:00:00", ""),
                      cubit.getFeedBackUser[index].userFeedback?.feedbackText !=
                          null
                          ? cubit.getFeedBackUser[index].userFeedback!.feedbackText
                          .toString()
                          : "dont any meassage",
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget comment(String text, String date, String message) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontFamily: primFont,
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              width: 8,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/Avatars.png"),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RatingBar.builder(
              textDirection: TextDirection.rtl,
              itemSize: 20,
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.orange,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            Text(
              date,
              style: const TextStyle(
                  fontFamily: primFont,
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          textDirection: TextDirection.rtl,
          message,
          style: const TextStyle(
              fontFamily: primFont, fontSize: 16, fontWeight: FontWeight.w800),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Divider(),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget CustomTextForm(TextEditingController controller,
      void Function()? onPress) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.end,
      decoration: InputDecoration(
          hintText: "اكتب تعليقك هنا",
          prefixIcon: Container(
            height: 35,
            margin: const EdgeInsets.only(left: 15),
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.black),
            child: Center(
              child: IconButton(
                onPressed: onPress,
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          ),
          focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          enabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
