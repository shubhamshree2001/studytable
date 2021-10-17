import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        margin: EdgeInsets.only(left: 10),
        height: MediaQuery.of(context).size.height * 0.07,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'STUDY',
                  style: TextStyle(
                    fontSize: 15,
                    shadows: <Shadow>[
                      Shadow(
                        blurRadius: 15,
                        color: Colors.black54,
                        offset: Offset.fromDirection(120, 12),
                      ),
                    ],
                  ),
                ),
                Text(
                  'table',
                  style: TextStyle(
                    fontSize: 30,
                    shadows: <Shadow>[
                      Shadow(
                        blurRadius: 15,
                        color: Colors.black54,
                        offset: Offset.fromDirection(120, 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: Text(
                'CARE\t\t\t\t\t\t\t\t\t A\t\t\t\t\t\t\t\t\t SMILE',
                style: TextStyle(
                  fontSize: 10,
                  // fontFamily: 'Pacifico',
                  shadows: <Shadow>[
                    Shadow(
                      blurRadius: 15,
                      color: Colors.black54,
                      offset: Offset.fromDirection(120, 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
