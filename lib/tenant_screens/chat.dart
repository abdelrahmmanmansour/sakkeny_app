import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/Core/Services/CachedHelper.dart';
import 'package:sakeny/Data/Model/UserModel.dart';
import 'package:sakeny/PostData/GetPost/get_post_cubit.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/profile.dart/profile.dart';
import 'package:sakeny/tenant_screens/Chat/chat_cubit.dart';
import 'package:sakeny/tenant_screens/profile.dart';

class Chat1 extends StatefulWidget {
   Chat1({super.key,required this.userModel});
UserModel userModel;
  @override
  State<Chat1> createState() => _Chat1State();
}

class _Chat1State extends State<Chat1> {
  @override
  void initState() {
    print("the length favorite is ${GetPostCubit.get(context).getAllFavorite.length}");

    GetPostCubit.get(context).getDataSuggest();
    GetPostCubit.get(context).getFavorite();
    ChatCubit.get(context).getChat(name:widget.userModel.userName.toString() ,id:CacheHelper.getData(key: "reId") );
    super.initState();
  }

  ScrollController scrollController = ScrollController();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x99F3EADA),
        elevation: 0,
        leading: Builder(
          builder: (BuildContext cotext) {
            return IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.phone_rounded,
                  color: orange,
                  size: 30,
                ));
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: ' ${widget.userModel.userFullName}\n',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Marhey',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                  const TextSpan(
                    text: 'اخر ظهور منذ 2 د',
                    style: TextStyle(
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
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Profile1(userModel: widget.userModel,);
                  },
                ));
              },
              child: Container(
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
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const ImageIcon(
                AssetImage("assets/images/Arrow - Right Square.png"),
                color: orange,
                size: 33,
              ),
            ),
          ),
        ],
      ),
      body: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          if (state is SuccessGetChat) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              scrollController.animateTo(
                scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            });
          }
        },
        builder: (context, state) {
          var cubit = ChatCubit.get(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: cubit.getMessage.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return widget.userModel.userId!=CacheHelper.getData(key: "reId")? ChatBubleForFriend(
                      message: cubit.getMessage[index].userChatText.toString(),
                    ):ChatBuble(  message: cubit.getMessage[index].userChatText.toString());

                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: controller,
                  onSubmitted: (data) async {
                    await sendMessage(context);
                  },
                  decoration: InputDecoration(
                    hintText: 'Send Message',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () async {
                        await sendMessage(context);
                      },
                      color: Colors.orangeAccent,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> sendMessage(BuildContext context) async {
    final message = controller.text;
    controller.clear();
    await ChatCubit.get(context).postChat(messages: message,name:widget.userModel.userName.toString() ,id:CacheHelper.getData(key: "reId") );
  }
}

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: Colors.grey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Marhey',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '3:02 am',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black.withOpacity(0.4),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubleForFriend extends StatelessWidget {
  const ChatBubleForFriend({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: Colors.orangeAccent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Marhey',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '3:02 am',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black.withOpacity(0.4),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
