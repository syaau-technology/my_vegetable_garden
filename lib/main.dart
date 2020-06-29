import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'constants.dart';
import 'ui_elements.dart';
import 'manager.dart';
import 'gardening.dart';
import 'about.dart';
import 'plants.dart';
import 'social.dart';

void main() {
  runApp(
    ChangeNotifierProvider<TabSelection>(
      create: (context) => TabSelection(),
      child: GardeningApp(),
    ),
  );
}

class GardeningApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Vegetable Garden',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(),
          Padding(
            padding: EdgeInsets.fromLTRB(
              0.0,
              padding.top,
              0.0,
              padding.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TopBar(),
                Expanded(
                  child: AnimatedContainer(
                    key: UniqueKey(),
                    duration: Duration(milliseconds: kAnimationDuration),
                    child: getBody(context),
                  ),
                ),
                BottomBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getBody(BuildContext context) {
    final tabSelection = Provider.of<TabSelection>(context);
    switch (tabSelection.selectedTab) {
      case Tabs.gardening:
        return Gardening();
        break;
      case Tabs.plants:
        return MyPlants();
        break;
      case Tabs.social:
        return Social();
        break;
      case Tabs.about:
        return About();
        break;
      default:
        return MyPlants();
        break;
    }
  }
}
