import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'hr@studytable.com',
  );

  final phone = "+919661221034";

  _launchTwitter(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          // forceWebView: true,
          // enableJavaScript: true,
          webOnlyWindowName: 'Follow on Twitter');
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 73,
      padding: EdgeInsets.only(bottom: 10),
      color: Colors.grey[200],
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Container(
                  height: 45.0,
                  width: 45.0,
                  child: Center(
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            25.0), // half of height and width of Image
                      ),
                      child: IconButton(
                        icon: new Icon(
                          Icons.mail,
                          size: 20.0,
                        ),
                        color: Color(0xFF162A49),
                        onPressed: () {
                          launch(_emailLaunchUri.toString());
                        },
                      ),
                    ),
                  )),
              new Container(
                  height: 45.0,
                  width: 45.0,
                  child: Center(
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            25.0), // half of height and width of Image
                      ),
                      child: IconButton(
                        icon: new FaIcon(
                          FontAwesomeIcons.twitter,
                          size: 20.0,
                        ),
                        color: Color(0xFF162A49),
                        onPressed: () {
                          _launchTwitter('https://twitter.com/YtableStud?s=09');
                        },
                      ),
                    ),
                  )),
              new Container(
                height: 45.0,
                width: 45.0,
                child: Center(
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          25.0), // half of height and width of Image
                    ),
                    child: IconButton(
                      icon: new Icon(
                        Icons.call,
                        size: 20.0,
                      ),
                      color: Color(0xFF162A49),
                      onPressed: () {
                        launch("tel://$phone");
                      },
                    ),
                  ),
                ),
              ),
              new Container(
                height: 45.0,
                width: 45.0,
                child: Center(
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          25.0), // half of height and width of Image
                    ),
                    child: IconButton(
                      icon: new FaIcon(
                        FontAwesomeIcons.whatsapp,
                        size: 20.0,
                      ),
                      color: Color(0xFF162A49),
                      onPressed: () async {
                        var whatsappUrl = "whatsapp://send?phone=$phone";
                        await canLaunch(whatsappUrl)
                            ? launch(whatsappUrl)
                            : SnackBar(
                                content: Text(
                                  'Whatsapp not installed',
                                ),
                              );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                'Copyright ©2020, All Rights Reserved.',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                    color: Color(0xFF162A49)),
              ),
              Text(
                'Powered by STUDYtable',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                    color: Color(0xFF162A49)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
