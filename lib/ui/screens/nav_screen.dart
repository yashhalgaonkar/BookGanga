import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/ui/screens/screens.dart';
import 'package:flutter/material.dart';
import '../../data/data.dart';
import 'HomeScreen/home_screen.dart';
import 'package:ionicons/ionicons.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    DiscoverBooksScreen(),
    Scaffold(),
    //Scaffold(),
    ActivityScreen(),
    UserProfileScreen(user: currentUser),
  ];

  final List<IconData> filledIcons = const [
    Ionicons.home,
    Ionicons.book,
    Ionicons.pencil,
    Ionicons.notifications,
  ];

  final List<IconData> outline_icons = const [
    Ionicons.home_outline,
    Ionicons.book_outline,
    Ionicons.pencil_outline,
    Ionicons.notifications_outline,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: BookGanga.kAccentColor,
        //unselectedItemColor: Colors.black87,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                  (_selectedIndex == 0) ? filledIcons[0] : outline_icons[0]),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                  (_selectedIndex == 1) ? filledIcons[1] : outline_icons[1]),
              label: "Books"),
          BottomNavigationBarItem(
              icon: Icon(
                  (_selectedIndex == 2) ? filledIcons[2] : outline_icons[2]),
              label: "Write"),
          BottomNavigationBarItem(
              icon: Icon(
                  (_selectedIndex == 3) ? filledIcons[3] : outline_icons[3]),
              label: "Activity"),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage("assets/images/dp.jpeg"),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
