import 'package:flutter/material.dart';

import 'constants.dart';
import 'manager.dart';

class Gardening extends StatefulWidget {
  @override
  _GardeningState createState() => _GardeningState();
}

class _GardeningState extends State<Gardening> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return ListView.builder(
      itemCount: gardeningItems.length,
      itemBuilder: (context, index) {
        final isSelected = index == selectedIndex;
        final paddingRight = isSelected ? 0.0 : padding.right + 60;
        final containerHeight = isSelected ? 480.0 : 110.0;
        final clipRadius = isSelected ? 0.0 : containerHeight / 2;
        return AnimatedContainer(
          height: containerHeight,
          duration: Duration(milliseconds: kAnimationDuration),
          padding: EdgeInsets.only(right: paddingRight, bottom: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(clipRadius),
              bottomRight: Radius.circular(clipRadius),
            ),
            child: GestureDetector(
              onTap: () {
                setState(
                  () => selectedIndex = isSelected ? -1 : index,
                );
              },
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(
                  padding.left + 20,
                  20,
                  padding.right + 20,
                  20,
                ),
                color: kDefaultBackgroundColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      gardeningItems[index].imageUrl,
                      height: kTopBarImageHeight,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              gardeningItems[index].title,
                              style: TextStyle(
                                fontSize: kTopBarFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800],
                              ),
                            ),
                            isSelected
                                ? Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: getContentDetails(index),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> getContentDetails(int index) {
    var contents = gardeningItems[index].content;

    var widgets = <Widget>[];

    for (GardeningContent content in contents) {
      if (content.imageUrl == null) {
        widgets.add(
          Row(
            children: [
              Flexible(
                child: Text(content.text),
              ),
            ],
          ),
        );
      } else {
        widgets.add(
          Row(
            children: [
              Image.asset(
                content.imageUrl,
                height: 66,
              ),
              Flexible(
                child: Text(content.text),
              ),
            ],
          ),
        );
      }
      widgets.add(SizedBox(height: 20));
    }

    return widgets;
  }

  String calculateDate(DateTime date) {
    final today = DateTime.now();
    final difference = today.difference(date).inDays;
    switch (difference) {
      case 0:
        return 'today';
        break;
      case 1:
        return 'yesterday';
        break;
      default:
        return '$difference days ago';
        break;
    }
  }
}
