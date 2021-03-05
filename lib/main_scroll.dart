/// Flutter code sample for NestedScrollView

// This example shows a [NestedScrollView] whose header is the combination of a
// [TabBar] in a [SliverAppBar] and whose body is a [TabBarView]. It uses a
// [SliverOverlapAbsorber]/[SliverOverlapInjector] pair to make the inner lists
// align correctly, and it uses [SafeArea] to avoid any horizontal disturbances
// (e.g. the "notch" on iOS when the phone is horizontal). In addition,
// [PageStorageKey]s are used to remember the scroll position of each tab's
// list.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: InstaProfilePage(),
    );
  }
}

// InstaProfilePage
class InstaProfilePage extends StatefulWidget {
  @override
  _InstaProfilePageState createState() => _InstaProfilePageState();
}

class _InstaProfilePageState extends State<InstaProfilePage> {
  double get randHeight => 10.0;

  List<Widget> _randomChildren;

  // Children with random heights - You can build your widgets of unknown heights here
  // I'm just passing the context in case if any widgets built here needs  access to context based data like Theme or MediaQuery
  List<Widget> _randomHeightWidgets(BuildContext context) {
    _randomChildren ??= List.generate(3, (index) {
      final height = randHeight.clamp(
        50.0,
        MediaQuery.of(context)
            .size
            .width, // simply using MediaQuery to demonstrate usage of context
      );
      return Container(
        color: Colors.primaries[index],
        height: height,
        child: Text('Random Height Child ${index + 1}'),
      );
    });

    return _randomChildren;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Persistent AppBar that never scrolls
      appBar: AppBar(
        title: Text('AppBar'),
        elevation: 0.0,
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          // allows you to build a list of elements that would be scrolled away till the body reached the top
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  _randomHeightWidgets(context),
                ),
              ),
            ];
          },
          // You tab view goes here
          body: Column(
            children: <Widget>[
              TabBar(
                tabs: [
                  Tab(text: 'A'),
                  Tab(text: 'B'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.count(
                      padding: EdgeInsets.zero,
                      crossAxisCount: 3,
                      children: Colors.primaries.map((color) {
                        return Container(color: color, height: 150.0);
                      }).toList(),
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      children: Colors.primaries.map((color) {
                        return Container(color: color, height: 150.0);
                      }).toList(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
