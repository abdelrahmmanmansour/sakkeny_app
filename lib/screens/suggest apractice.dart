import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/Core/Services/CachedHelper.dart';
import 'package:sakeny/PostData/UpLoadData/upload_data_cubit.dart';
import 'package:sakeny/PostData/UpLoadData/upload_data_state.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/castom/text_filed.dart';
import 'package:sakeny/nav_screens/post_details.dart';
import 'package:sakeny/navigation_bar/navigation_bar.dart';
import 'package:sakeny/screens/view_post.dart';

class suggestpractice extends StatefulWidget {
   suggestpractice({super.key,
   required this.data,
   required this.value,
   });
String data;
bool value;
  @override
  State<suggestpractice> createState() => _suggestpracticeState();
}

class _suggestpracticeState extends State<suggestpractice> {
  bool isviable = false;

  @override
  Widget build(BuildContext context) {
    var Cubit=TestCubit.get(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<TestCubit, UploadDataState>(
        listener: (context, state) {
          if (state is SuccessUpload) {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
              return Nave();
            }), (route) => false);
            Cubit.PostArea.clear();
            Cubit.PostKitchens.clear();
            Cubit.PostBedrooms.clear();
            Cubit.PostBathrooms.clear();
            Cubit.selectedBenefits.clear();
            Cubit.images.clear();
            Cubit.suggestUser.clear();
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/images/Arrow - Right Square.png",
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      "السعر المقترح",
                      style: TextStyle(
                        fontFamily: "Marhey",
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        height: 2,
                        letterSpacing: 0.23,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.infinity,
                      height: 44,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffff8c40)),
                        color: const Color(0xfff8f2e9),
                      ),
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: const TextStyle(
                              fontFamily: "Marhey",
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              height: 2,
                              color: Color(0xff00000),
                            ),
                            children: [
                              TextSpan(
                                text: CacheHelper.getData(key: "price")
                                    .toString(),
                                style: const TextStyle(
                                  fontFamily: "Marhey",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff3e3e3e),
                                ),
                              ),
                              const TextSpan(
                                text: "ج.م شهريا",
                                style: TextStyle(
                                  fontFamily: "Marhey",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff858585),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Center(
                      child: Text(
                        "هل انت موافق على اظهار هذا السعر للمستأجر",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: "Marhey",
                          fontSize: 13,
                          height: 2,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(100, 0, 0, 45),
                      width: double.infinity,
                      height: 36,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isviable = !isviable;
                                });
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                width: 58,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffff8c40)),
                                  color: const Color(0x99f3eada),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(
                                  child: Text(
                                    "لا",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Marhey",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      height: 2,
                                      color: Color(0xff858585),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 33,
                            ),
                            GestureDetector(
                              onTap: () {
                                int postArea = int.parse(Cubit.PostArea.text);
                                int postKitchens = int.parse(Cubit.PostKitchens.text);
                                int postBedrooms = int.parse(Cubit.PostBedrooms.text);
                                int postBathrooms = int.parse(Cubit.PostBathrooms.text);
                
                                Cubit.postData(
                                    Cubit.images,
                                    Cubit.selectedBenefits,
                                    postArea,
                                    postKitchens,
                                    postBedrooms,
                                    widget.value ? false : true,
                                    postBathrooms,
                                    widget.data,
                                    Cubit.late ?? "20.222",
                                    Cubit.lang ?? "2000",
                                    "",
                                    CacheHelper.getData(key: "price").toString()
                                );
                
                
                
                              },
                              child: Container(
                                width: 58,
                                height: double.infinity,
                                decoration: ShapeDecoration(
                                  color: const Color(0x3f808080),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child:  Center(
                                  child: Text(
                                  state is LoadingGetUser?"تحميل " :"نعم",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Marhey",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      height: 2,
                                      color: Color(0xff858585),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Visibility(
                        visible: isviable ? true : false,
                        child: Column(children: [
                          CastomText(
                
                            isvible: false,
                            textEditingController: Cubit.suggestUser,
                            onChange: (data) {},
                            hintText: "أدخل السعر (ج.م)",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CastomButton(onTap: () {
                            int postArea = int.parse(Cubit.PostArea.text);
                            int postKitchens = int.parse(Cubit.PostKitchens.text);
                            int postBedrooms = int.parse(Cubit.PostBedrooms.text);
                            int postBathrooms = int.parse(Cubit.PostBathrooms.text);
                
                            Cubit.postData(
                                Cubit.images,
                                Cubit.selectedBenefits,
                                postArea,
                                postKitchens,
                                postBedrooms,
                                widget.value ? false : true,
                                postBathrooms,
                                widget.data,
                                Cubit.late ?? "20.222",
                                Cubit.lang ?? "2000",
                                Cubit.suggestUser.text,
                               ""
                            );
                
                          }, text:  state is LoadingGetUser?"تحميل ": "التالى")
                        ],))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
