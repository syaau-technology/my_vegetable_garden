import 'package:flutter/material.dart';

import 'constants.dart';
import 'manager.dart';

class MyPlants extends StatefulWidget {
  @override
  _MyPlantsState createState() => _MyPlantsState();
}

class _MyPlantsState extends State<MyPlants> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return ListView.builder(
      itemCount: currentPlants.length + 1,
      itemBuilder: (context, index) {
        if (index == currentPlants.length) {
          return IconButton(
            icon: Image.asset('assets/images/icons/add.png'),
            iconSize: 60,
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Choose Vegetable'),
                  content: Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 20,
                    children: getPlantImages(),
                  ),
                  actions: [
                    FlatButton(
                      child: Text('Cancel'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          final isSelected = index == selectedIndex;
          final paddingRight = isSelected ? 0.0 : padding.right + 60;
          final containerHeight = isSelected ? 188.0 : 110.0;
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
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(
                          'Remove ${getPlantTitle(currentPlants[index].kind)}?'),
                      content: Text(
                          'If you tap "OK", ${getPlantTitle(currentPlants[index].kind)} will be removed.'),
                      actions: [
                        FlatButton(
                          child: Text('Cancel'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        FlatButton(
                          child: Text('OK'),
                          onPressed: () {
                            setState(() {
                              currentPlants.removeAt(index);
                            });
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
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
                        getPlantImageUrl(currentPlants[index].kind),
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
                                getPlantTitle(currentPlants[index].kind),
                                style: TextStyle(
                                  fontSize: kTopBarFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[800],
                                ),
                              ),
                              Text(
                                'Planted ${calculateDate(currentPlants[index].plantedDate)}',
                              ),
                              isSelected
                                  ? Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Watered ${calculateDate(currentPlants[index].wateredDate)}',
                                                ),
                                                Spacer(),
                                                RaisedButton.icon(
                                                  onPressed: () {
                                                    setState(() {
                                                      currentPlants[index]
                                                              .wateredDate =
                                                          DateTime.now();
                                                    });
                                                  },
                                                  icon: Image.asset(
                                                    'assets/images/icons/watering_can.png',
                                                    height: 20,
                                                  ),
                                                  label: Text('Water Now'),
                                                ),
                                              ],
                                            ),
                                          ],
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
        }
      },
    );
  }

  List<Widget> getPlantImages() {
    List<Widget> widgets = <Widget>[];
    for (Plants plant in Plants.values) {
      widgets.add(
        FlatButton(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                getPlantImageUrl(plant),
                width: 48,
              ),
              Text(getPlantTitle(plant)),
            ],
          ),
          onPressed: () {
            setState(
              () {
                currentPlants.add(
                  Plant(
                    10,
                    plant,
                    DateTime.now(),
                    DateTime.now(),
                  ),
                );
              },
            );
            Navigator.of(context).pop();
          },
        ),
      );
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
