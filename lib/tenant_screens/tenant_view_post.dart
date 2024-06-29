import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sakeny/Data/Model/GetPostDataUser.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/tenant_screens/PersonInformation/person_information_cubit.dart';
import 'package:get/get.dart';

class TenantViewPost extends StatefulWidget {
  TenantViewPost({super.key, required this.getPostDataUser});

  GetPostDataUser getPostDataUser;

  @override
  State<TenantViewPost> createState() => _TenantViewPostState();
}

class _TenantViewPostState extends State<TenantViewPost> {
  TextEditingController controller = TextEditingController();
@override
  void initState() {

PersonInformationCubit.get(context).getMessage(widget.getPostDataUser.postId!.toInt());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constrains) {
            return SizedBox(
              //height:  constrains.maxHeight/2,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: ListView.separated(
                      itemCount: widget.getPostDataUser.postPicTbls!.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 12,
                        );
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 4, right: 20, left: 20),
                          child: Container(
                            width: 331,
                            height: 200,
                            child: Image.memory(
                              base64Decode(widget.getPostDataUser
                                  .postPicTbls![index].pictureString
                                  .toString()),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
              ],
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.1,
              maxChildSize: .8,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(45),
                      topLeft: Radius.circular(45)),
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      controller: scrollController,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            const Center(
                              child: ImageIcon(
                                AssetImage("assets/images/Arrow - Up 2.png"),
                                size: 35,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xFFF3EADA),
                                  ),
                                  width: 100,
                                  height: 50,
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "أحمد طارق",
                                        style: TextStyle(
                                          color: Color(0xFF858585),
                                          fontSize: 12,
                                          fontFamily: 'Marhey',
                                          fontWeight: FontWeight.w300,
                                          height: 0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                            "assets/images/ahme.png"),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "7000",
                                      style: TextStyle(
                                        fontFamily: "Marhey",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        height: 2,
                                        color: Color(0xff3e3e3e),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "ج.م شهرياً",
                                      style: TextStyle(
                                        fontFamily: "Marhey",
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300,
                                        height: 2,
                                        color: Color(0xff858585),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                " المنصورة ، حي الجامعة",
                                style: TextStyle(
                                  fontFamily: "Marhey",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  height: 1.67,
                                  color: Color(0xff3e3e3e),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ImageIcon(const AssetImage('assets/icons/Heart.png'),
                                    color: widget.getPostDataUser.isFavourited == true
                                        ? Colors.red
                                        : const Color(0xFF858585)),
                                const Spacer(),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "حمام ${widget.getPostDataUser.postBathrooms} غرف نوم ${widget.getPostDataUser.postBedrooms}  ${widget.getPostDataUser.postArea}  م  ",
                                      style: const TextStyle(
                                        color: Color(0xFF858585),
                                        fontSize: 12,
                                        fontFamily: 'Marhey',
                                        fontWeight: FontWeight.w300,
                                        height: 0,
                                      ),
                                    )),
                              ],
                            ),

                            const Divider(
                              color: Colors.grey,
                            ),
                            Container(
                                width: 138,
                                height: 30,
                                decoration: ShapeDecoration(
                                  color: const Color(0xAFF3EADA),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: const Text(
                                          'عرض على الخريطة',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 12,
                                            fontFamily: 'Marhey',
                                            fontWeight: FontWeight.w300,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, "map");
                                      },
                                      icon: const Icon(
                                        Icons.location_on,
                                        color: orange,
                                      ),
                                      alignment: Alignment.topCenter,
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            const Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "شقة مفروشة للايجار بحي الجامعة للطلبة حتى 6 افراد ",
                                  style: TextStyle(
                                    color: Color(0xFF5B5B5B),
                                    fontFamily: "Marhey",
                                    fontSize: 13,
                                  ),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            const Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'المزايا والخدمات ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: primFont,
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 150,
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: widget.getPostDataUser.features!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 20,
                                        crossAxisCount: 3,
                                        mainAxisExtent: 40),
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xAFF3EADA),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        widget.getPostDataUser
                                            .features![index].featuresName
                                            .toString()
                                            .replaceAll("true", ""),
                                        style: const TextStyle(
                                          color: Color(0xFF858585),
                                          fontSize: 12,
                                          fontFamily: 'Marhey',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
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
                              height: 10,
                            ),
                            CustomTextForm(
                              controller,
                              () {
                                PersonInformationCubit.get(context).sendMessage(
                                    postId: widget.getPostDataUser.postId!.toInt(),
                                    message: controller.text);
                                controller.clear();
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            BlocConsumer<PersonInformationCubit, PersonInformationState>(
                              listener: (context, state) {
                                if(state is LoadingGetMessage){
                                   const CircularProgressIndicator();
                                }
                                if(state is ErrorGetMessage){

                                }
                              },
                              builder: (context, state) {
                                var cubit = PersonInformationCubit.get(context);
                                  // Return your ListView.builder with the updated message list
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height * .6,
                                    child: ListView.builder(
                                      itemCount: cubit.message.length,
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return comment(
                                          cubit.message[index].user?.userFullName != null
                                              ? cubit.message[index].user!.userFullName.toString()
                                              : "",
                                          cubit.message[index].timeCreated.toString().replaceAll("T00:00:00", ""),
                                          cubit.message[index].feedbackText != null
                                              ? cubit.message[index].feedbackText.toString()
                                              : "dont any meassage",
                                        );
                                      },
                                    ),
                                  );

                              },
                            )

                            // Add more list tiles or widgets as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ]),
      ),
    );
  }

  Widget review() {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "عمرو عويس",
              style: TextStyle(
                  fontFamily: primFont,
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              width: 8,
            ),
            CircleAvatar(
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
            const Text(
              "10/12/23",
              style: TextStyle(
                  fontFamily: primFont, fontSize: 12, color: Color(0xFF858585)),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          textDirection: TextDirection.rtl,
          "سررت بمعرفة دكتور أحمد أتوجة لة بالشكر على حسن المعاملة",
          style: TextStyle(
              fontFamily: primFont, fontSize: 12, color: Color(0xFF858585)),
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

  Widget CustomTextForm(
      TextEditingController controller, void Function()? onPress) {
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

  // Container benefit({required String pros})=> Container(
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
}
