import 'package:flutter/material.dart';

import 'constants.dart';
import 'manager.dart';

class Social extends StatefulWidget {
  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        padding.left + 20,
        10,
        padding.right + 20,
        10,
      ),
      child: Container(
        width: double.infinity,
//          color: kDefaultBackgroundColor,
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    color: kDefaultBackgroundColor,
                    padding: EdgeInsets.all(20),
//                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 8.0),
                            ClipOval(
                              child: Image.network(
                                users[index].photoUrl,
                                fit: BoxFit.cover,
                                width: 30,
                                height: 30,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(users[index].name)
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(
                              'https://source.unsplash.com/featured/?vegetable,garden,$index',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Row(
                          children: [
//                            SizedBox(width: 8.0),
                            IconButton(
                              icon: Icon(Icons.favorite_border),
                              onPressed: () {},
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.thumb_up),
                              onPressed: () {},
                            ),
                            SizedBox(width: 8.0),
                            IconButton(
                              icon: Icon(Icons.thumb_down),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
