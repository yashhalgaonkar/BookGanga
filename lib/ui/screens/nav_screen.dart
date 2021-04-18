import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/ui/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../data/data.dart';
import 'HomeScreen/home_screen.dart';

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
    //Scaffold(),
    ActivityScreen(),
    UserProfileScreen(user: currentUser),
  ];

  final List<IconData> icons = const [
    Icons.home,
    MdiIcons.bookOpenVariant,
    Icons.notes,
    Icons.notifications,
    MdiIcons.accountCircleOutline,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: icons.length,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
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
            BottomNavigationBarItem(icon: Icon(icons[3]), label: "Activity"),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 14,
                backgroundImage: AssetImage("assets/images/dp.jpeg"),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
