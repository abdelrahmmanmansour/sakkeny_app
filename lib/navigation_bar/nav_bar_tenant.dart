import 'package:flutter/material.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/tenant_screens/chat_box.dart';
import 'package:sakeny/tenant_screens/fav.dart';
import 'package:sakeny/tenant_screens/home.dart';
import 'package:sakeny/tenant_screens/notification.dart';

class NaveTenant extends StatefulWidget {
  const NaveTenant({Key? key}) : super(key: key);

  @override
  State<NaveTenant> createState() => _NaveState();
}

class _NaveState extends State<NaveTenant> {
  int cindex = 3;
  List<Widget> screens = [
    Favouite(),
    NotificationScreen(),
    ChatBox1(),

    Home(),
  ];
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
              icon: ImageIcon(AssetImage('assets/icons/Heart.png'),
                  color: Color(0xFF858585)),
              activeIcon: ImageIcon(AssetImage('assets/icons/Heart.png'),
                  color: orange),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/Notification.png'),
                  color: Color(0xFF858585)),
              activeIcon: ImageIcon(AssetImage('assets/icons/Notification.png'),
                  color: orange),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/Send.png'),
                  color: Color(0xFF858585)),
              activeIcon:
              ImageIcon(AssetImage('assets/icons/Send.png'), color: orange),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/Home.png'),
                  color: Color(0xFF858585)),
              activeIcon: ImageIcon(AssetImage('assets/icons/Home.png'),
                  color: orange),
              label: '')
        ],
      ),
    );
  }
}
