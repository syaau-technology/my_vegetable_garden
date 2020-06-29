import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'manager.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabSelection = Provider.of<TabSelection>(context);
    return AnimatedSwitcher(
      duration: Duration(milliseconds: kAnimationDuration),
      child: Container(
        key: UniqueKey(),
        width: double.infinity,
        height: double.infinity,
        child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              kBackgroundImageOverlayColor,
              BlendMode.luminosity,
            ),
            child: Image.asset(
              getBackgroundImageUrl(tabSelection.selectedTab),
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabSelection = Provider.of<TabSelection>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(
            kTopBarHeight / 2,
          ),
        ),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: kTopBarHeight,
            maxWidth: kTopBarMaxWidth,
          ),
          height: kTopBarHeight,
          color: kTopBarBackgroundColor,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: kAnimationDuration),
            child: Row(
              key: UniqueKey(),
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                Image.asset(
                  getTabImageUrl(tabSelection.selectedTab),
                  height: kTopBarImageHeight,
                ),
                SizedBox(width: 20),
                Text(
                  getTabTitle(tabSelection.selectedTab),
                  style: TextStyle(
                    fontSize: kTopBarFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(
            kBottomBarHeight / 2,
          ),
        ),
        child: Container(
          width: kBottomBarWidth,
          height: kBottomBarHeight,
          color: kTopBarBackgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              bottomBarIcon(
                context,
                Tabs.gardening,
              ),
              Spacer(),
              bottomBarIcon(
                context,
                Tabs.plants,
              ),
              Spacer(),
              bottomBarIcon(
                context,
                Tabs.social,
              ),
              Spacer(),
              bottomBarIcon(
                context,
                Tabs.about,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomBarIcon(BuildContext context, Tabs tab) {
    final tabSelection = Provider.of<TabSelection>(context);

    final opacity = tab == tabSelection.selectedTab ? 1.0 : 0.35;
    var imageUrl = '';

    switch (tab) {
      case Tabs.gardening:
        imageUrl = 'assets/images/icons/hand_planting.png';
        break;
      case Tabs.plants:
        imageUrl = 'assets/images/icons/potted_plant.png';
        break;
      case Tabs.social:
        imageUrl = 'assets/images/icons/social_network.png';
        break;
      case Tabs.about:
        imageUrl = 'assets/images/icons/info.png';
        break;
    }

    return AnimatedOpacity(
      duration: Duration(milliseconds: kAnimationDuration),
      opacity: opacity,
      child: GestureDetector(
        onTap: () {
          tabSelection.changeSelectedTab(tab);
        },
        child: Image.asset(
          imageUrl,
          height: kBottomBarImageHeight,
        ),
      ),
    );
  }
}
