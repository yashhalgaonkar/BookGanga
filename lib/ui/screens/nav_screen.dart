import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/ui/screens/screens.dart';
import 'package:flutter/material.dart';
import '../../data/data.dart';
import 'HomeScreen/home_screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

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

  final List<IconData> icons = const [
    Icons.home,
    EvaIcons.bookOpen,
    EvaIcons.edit,
    Icons.notifications,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    
      return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: BookGanga.kAccentColor,
          unselectedItemColor: Colors.black87,
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(icons[0]), label: "Home"),
            BottomNavigationBarItem(icon: Icon(icons[1]), label: "Books"),
            BottomNavigationBarItem(icon: Icon(icons[2]), label: "Write"),
            BottomNavigationBarItem(
                icon: Icon(icons[3]), label: "Activity"),
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
