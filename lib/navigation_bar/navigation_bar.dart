import 'package:flutter/material.dart';
import 'package:sakeny/Core/Services/CachedHelper.dart';
import 'package:sakeny/PostData/GetPost/get_post_cubit.dart';
import 'package:sakeny/PostData/UpLoadData/upload_data_cubit.dart';
import 'package:sakeny/nav_screens/myposts.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/nav_screens/chat_box.dart';
import 'package:sakeny/nav_screens/notification.dart';
import 'package:sakeny/nav_screens/post_details.dart';

class Nave extends StatefulWidget {
  const Nave({Key? key}) : super(key: key);

  @override
  State<Nave> createState() => _NaveState();
}

class _NaveState extends State<Nave> {

  int cindex = 3;
  List<Widget> screens = [
    post_details(),
    ChatBox(),
    NotificationScreen(),
    myposts(),
  ];
  @override
  void initState() {
    print("the id is ${CacheHelper.getData(key: "reId")}");
    TestCubit.get(context).getDataPost(CacheHelper.getData(key: "reId"));
    super.initState();
  }
  @override


  Widget build(BuildContext context) {


    return Scaffold(

      body: screens[cindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cindex,
        onTap: (index) {
          setState(() {
            cindex = index;
          });
        },
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/Group.png'),
                  color: Color(0xFF858585)),
              activeIcon: ImageIcon(AssetImage('assets/icons/Group.png'),
                  color: orange),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/Send.png'),
                  color: Color(0xFF858585)),
              activeIcon:
                  ImageIcon(AssetImage('assets/icons/Send.png'), color: orange),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/Notification.png'),
                  color: Color(0xFF858585)),
              activeIcon: ImageIcon(AssetImage('assets/icons/Notification.png'),
                  color: orange),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/Profile.png'),
                  color: Color(0xFF858585)),
              activeIcon: ImageIcon(AssetImage('assets/icons/Profile.png'),
                  color: orange),
              label: '')
        ],
      ),
    );
  }
}
