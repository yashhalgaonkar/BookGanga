import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/ui/screens/screens.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
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
        // bottomNavigationBar: CustomTabBar(
        //   icons: icons,
        //   selectedIndex: _selectedIndex,
        //   onTap: (index) {
        //     setState(
        //       () {
        //         _selectedIndex = index;
        //       },
        //     );
        //   },
        // ),

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: BookGanga.kAccentColor,
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

        //* No color customization
        // bottomNavigationBar: FlashyTabBar(
        //   selectedIndex: _selectedIndex,
        //   showElevation: true,
        //   backgroundColor: BookGanga.scaffold,
        //   onItemSelected: (index) => setState(() {
        //     _selectedIndex = index;
        //   }),
        //   items: [
        //     FlashyTabBarItem(
        //       icon: Icon(icons[0]),
        //       title: Text('Home'),
        //     ),
        //     FlashyTabBarItem(
        //       icon: Icon(icons[1]),
        //       title: Text('Books'),
        //     ),
        //     FlashyTabBarItem(
        //       icon: Icon(icons[2]),
        //       title: Text('Write'),
        //     ),
        //     FlashyTabBarItem(
        //       icon: Icon(icons[3]),
        //       title: Text('Activity'),
        //     ),
        //     FlashyTabBarItem(
        //       icon: Icon(icons[4]),
        //       title: Text('Profile'),
        //     ),
        //   ],
        // ),

        //* Not working
        // bottomNavigationBar: TitledBottomNavigationBar(
        //   currentIndex: _selectedIndex,
        //   onTap: (index) => print(''),
        //   reverse: false,
        //   curve: Curves.easeIn,
        //   items: [
        //     TitledNavigationBarItem(
        //       title: Text('Home'),
        //       icon: icons[0],
        //     ),
        //     TitledNavigationBarItem(
        //       title: Text('Books'),
        //       icon: icons[1],
        //     ),
        //     TitledNavigationBarItem(
        //       title: Text('Write'),
        //       icon: icons[2],
        //     ),
        //     TitledNavigationBarItem(
        //       title: Text('Activity'),
        //       icon: icons[3],
        //     ),
        //     TitledNavigationBarItem(
        //       title: Text('Profile'),
        //       icon: icons[4],
        //     ),
        //   ],
        //   activeColor: BookGanga.kNiceAccentColor,
        //   inactiveColor: BookGanga.kDarkBlack,
        // ),
      ),
    );
  }
}
