import 'package:STUDYtable/anim/custom_routes.dart';
import 'package:STUDYtable/models/studentData.dart';
import 'package:STUDYtable/screens/edit_profile.dart';
import 'package:STUDYtable/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nice_button/NiceButton.dart';

class MyStudytable extends StatelessWidget {
  // final StudentData data;
  // MyStudytable({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildSubjectProgress(
        String subName, int readvalue, Color color, int revisedValue) {
      return Container(
        margin: EdgeInsets.all(9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              subName,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: FAProgressBar(
                    backgroundColor: Colors.black12,
                    size: MediaQuery.of(context).size.height * 0.03,
                    currentValue: readvalue,
                    displayText: '%',
                    progressColor: color,
                    displayTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: FAProgressBar(
                    backgroundColor: Colors.black12,
                    // changeProgressColor: Colors.black,
                    progressColor: Colors.black,
                    size: MediaQuery.of(context).size.height * 0.03,
                    currentValue: revisedValue,
                    displayText: '%',
                    displayTextStyle: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(15, 30, 15, 15),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        style: GoogleFonts.lato(
                            // fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.09,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        text: 'My  ',
                      ),
                      TextSpan(
                        style: GoogleFonts.lato(
                            // fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        text: 'STUDY ',
                      ),
                      TextSpan(
                        style: GoogleFonts.lato(
                            // fontWeight: FontWeight.bold,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.12,
                            color: Colors.black),
                        text: 'table',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.7,
                child: Divider(
                  thickness: 2,
                  color: Colors.black38,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[400],
                      offset: Offset(0, 10),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(
                  top: 20,
                ),
                width: size.width * 0.9,
                // height: size.height * 0.6,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300],
                            offset: Offset(0, 10),
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(bottom: 15),
                      child: Center(
                        child: Text(
                          'My Progress',
                          style: GoogleFonts.lato(
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: size.width * 0.07,
                              height: size.height * 0.035,
                              child: const DecoratedBox(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.red,
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.red,
                                      Colors.yellow,
                                      Colors.green,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              '\t\t\tRead',
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: size.width * 0.07,
                              height: size.height * 0.035,
                              child: const DecoratedBox(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              '\t\t\tRevised',
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _buildSubjectProgress('PHYSICS', 54, Colors.amber, 25),
                    _buildSubjectProgress('CHEMISTRY', 29, Colors.red, 24),
                    _buildSubjectProgress('MATHS', 85, Colors.green, 75),
                    _buildSubjectProgress('HINDI', 0, Colors.white, 0),
                    _buildSubjectProgress('ENGLISH', 100, Colors.green, 37),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[400],
                          offset: Offset(2, 5),
                          blurRadius: 5.0,
                        ),
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('lib/assets/images/faceicon.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    'iamgopalgaur',
                    // data.username,
                    style: GoogleFonts.lato(
                        fontStyle: FontStyle.italic,
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              NiceButton(
                background: null,
                gradientColors: [Colors.purple[100], Colors.amber[100]],
                width: size.width * 0.6,
                elevation: 10,
                radius: 25,
                onPressed: () => Navigator.of(context).pushReplacement(
                  CustomRoute(
                    builder: (ctx) => EditProfile(),
                  ),
                ),
                text: 'Edit  Profile',
                textColor: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[400],
                      offset: Offset(0, 10),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                width: size.width * 0.9,
                // height: size.height * 0.1,

                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Name',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('Gopal Gaur'),
                    ),
                    ListTile(
                      title: Text(
                        'Email',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('gopalgaur95@gmail.com'),
                    ),
                    ListTile(
                      title: Text(
                        'Mobile',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('8209203870'),
                    ),
                    ListTile(
                      title: Text(
                        'Goal',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('My goal is to get in iit'),
                    ),
                    ListTile(
                      title: Text(
                        'School',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('St. Xavier\'s School'),
                    ),
                    ListTile(
                      title: Text(
                        'Class',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('XII'),
                    ),
                    ListTile(
                      title: Text(
                        'City',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('Bangalore'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: FooterSection(),
                height: MediaQuery.of(context).size.height * 0.15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
