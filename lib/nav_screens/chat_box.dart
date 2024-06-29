import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/nav_screens/chat.dart';
import 'package:sakeny/tenant_screens/Chat/chat_cubit.dart';
import 'package:sakeny/tenant_screens/chat.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({super.key});

  @override
  State<ChatBox> createState() => _ChatBox1State();
}

class _ChatBox1State extends State<ChatBox> {
  @override
  void initState() {
    ChatCubit.get(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        body: BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubitChat=ChatCubit.get(context);
            return Column(

              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(50),
                    child: Text(
                      'صندوق الرسائل',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: primFont,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 9),
                  width: 317,
                  height: 43,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFFD0D0D0)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: TextField(
                    textAlign: TextAlign.right,
                    onChanged: (data) {},
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        padding: const EdgeInsets.only(bottom: 7),
                        onPressed: () {},
                        icon: const Icon(

                          Icons.search_rounded,
                          color: orange,
                          size: 25,
                        ),),
                      hintText: "البحث",
                      hintStyle: const TextStyle(

                        color: Color(0xFF858585),
                        fontSize: 16,
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
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: ListView(
                      children: [

                        ListView.builder(
                          itemCount: cubitChat.getUser.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (cubitChat.getUser[index].userAccountType == "مستأجر") {
                              return nameMessage(
                                    () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return Chat1(userModel: cubitChat.getUser[index],);
                                  },));
                                },
                                "25/1",
                                "hello every body",
                                cubitChat.getUser[index].userFullName.toString(),
                              );
                            } else {
                              return SizedBox.shrink();  // Return an empty widget if the condition is not met
                            }
                          },
                        )

                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        )
    );
  }

  Widget nameMessage(void Function()? onPress,String timeText,String chatMessage,String namePerson) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                timeText,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.800000011920929),
                  fontSize: 13,
                  fontFamily: primFont,
                  fontWeight: FontWeight.w400,
                  height: 0.08,
                ),
              ),
            ),
            GestureDetector(
              onTap: onPress,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: ' ${namePerson}\n',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Marhey',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: chatMessage,
                      style: const TextStyle(
                        color: Color(0xFF858585),
                        fontSize: 12,
                        fontFamily: 'Marhey',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(width: 10,),
            Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/Avatars.png"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(90),
                ),
              ),
            ),


          ],
        ),
        const SizedBox(height: 10,),
        const Divider(),
        const SizedBox(height: 20,),
      ],
    );
  }
}