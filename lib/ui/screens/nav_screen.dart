import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/ui/screens/screens.dart';
import 'package:book_ganga/ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../data/data.dart';
import 'HomeScreen/home_screen.dart';
import 'package:ionicons/ionicons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
    Ionicons.person
  ];

  final List<IconData> outline_icons = const [
    Ionicons.home_outline,
    Ionicons.book_outline,
    Ionicons.pencil_outline,
    Ionicons.notifications_outline,
    Ionicons.person_outline,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: BookGanga.kAccentColor,
      //   //unselectedItemColor: Colors.black87,
      //   backgroundColor: Colors.white,
      //   currentIndex: _selectedIndex,
      //   onTap: (value) {
      //     setState(() {
      //       _selectedIndex = value;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //             (_selectedIndex == 0) ? filledIcons[0] : outline_icons[0]),
      //         label: "Home"),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //             (_selectedIndex == 1) ? filledIcons[1] : outline_icons[1]),
      //         label: "Books"),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //             (_selectedIndex == 2) ? filledIcons[2] : outline_icons[2]),
      //         label: "Write"),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //             (_selectedIndex == 3) ? filledIcons[3] : outline_icons[3]),
      //         label: "Activity"),
      //     BottomNavigationBarItem(
      //       icon: CircleAvatar(
      //         radius: 14,
      //         backgroundImage: AssetImage("assets/images/dp.jpeg"),
      //       ),
      //       label: "Profile",
      //     ),
      //   ],
      // ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            rippleColor:
                Colors.purple[800], // tab button ripple color when pressed
            hoverColor: Colors.purple[700], // tab button hover color
            haptic: false, // haptic feedback
            tabBorderRadius: 15,
            // tabActiveBorder:
            //     Border.all(color: Colors.black, width: 1), // tab button border
            // tabBorder:
            //     Border.all(color: Colors.grey, width: 1), // tab button border
            // tabShadow: [
            //   BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
            // ], // tab button shadow
            curve: Curves.easeIn, // tab animation curves
            duration: Duration(milliseconds: 100), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: Colors.grey[800], // unselected icon color
            activeColor: BookGanga.kAccentColor, // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor:
                Colors.purple.withOpacity(0.1), // selected tab background color
            padding: EdgeInsets.symmetric(
                vertical: 10, horizontal: 3), // navigation bar padding
            tabs: [
              GButton(
                icon: (_selectedIndex == 0) ? filledIcons[0] : outline_icons[0],
                text: 'Home',
              ),
              GButton(
                icon: (_selectedIndex == 1) ? filledIcons[1] : outline_icons[1],
                text: 'Books',
              ),
              GButton(
                icon: (_selectedIndex == 2) ? filledIcons[2] : outline_icons[2],
                text: 'Write',
              ),
              GButton(
                icon: (_selectedIndex == 3) ? filledIcons[3] : outline_icons[3],
                text: 'Activity',
              ),
              GButton(
                icon: (_selectedIndex == 4) ? filledIcons[4] : outline_icons[4],
                text: 'Profile',
              )
            ]),
      ),
    );
  }
}
