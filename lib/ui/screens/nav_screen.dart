
import 'package:book_ganga/ui/screens/screens.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../data/data.dart';
import 'home_screen.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    ActivityScreen(),
    UserProfileScreen(user: currentUser),
  ];

  final List<IconData> icons = const [
    Icons.home,
    MdiIcons.bookOpenVariant,
    MdiIcons.pencilOutline,
    MdiIcons.bellOutline,
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
        bottomNavigationBar: CustomTabBar(
          icons: icons,
          selectedIndex: _selectedIndex,
          onTap: (index) {
            setState(
              () {
                _selectedIndex = index;
              },
            );
          },
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
