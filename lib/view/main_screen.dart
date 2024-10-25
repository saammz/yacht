import 'package:airbnb_app_ui/utils/constants.dart';
import 'package:airbnb_app_ui/view/explore_screen.dart';
import 'package:airbnb_app_ui/view/message.dart';
import 'package:airbnb_app_ui/view/profile_page.dart';
import 'package:airbnb_app_ui/view/wishlists.dart';
import 'package:flutter/material.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int selectedIndex = 0;
  late final List<Widget> page;

  @override
  void initState() {
    page = [
      const ExploreScreen(),
      const Wishlists(),
      const Scaffold(),
      const MessagesScreen(),
      const ProfilePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 5,
        iconSize: 32,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.black45,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.network(
              "https://cdn3.iconfinder.com/data/icons/feather-5/24/search-512.png",
              height: 25,
              color: selectedIndex == 0 ? primaryColor : Colors.black45,
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              size: 25,
              color: selectedIndex == 1 ? primaryColor : Colors.black45,
            ),
            label: "Wishlists",
          ),
          BottomNavigationBarItem(
            icon: Image.network(
              "https://cdn0.iconfinder.com/data/icons/sea-13/512/962-41-512.png",
              height: 25,
              color: selectedIndex == 2 ? primaryColor : Colors.black45,
            ),
            label: "Trips",
          ),
          BottomNavigationBarItem(
            icon: Image.network(
              "https://static.vecteezy.com/system/resources/thumbnails/014/441/006/small_2x/chat-message-thin-line-icon-social-icon-set-png.png",
              height: 25,
              color: selectedIndex == 3 ? primaryColor : Colors.black45,
            ),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Image.network(
              "https://cdn-icons-png.flaticon.com/512/1144/1144760.png",
              height: 25,
              color: selectedIndex == 4 ? primaryColor : Colors.black45,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: page[selectedIndex],
    );
  }
}
