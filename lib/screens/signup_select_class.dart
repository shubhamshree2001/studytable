import 'package:STUDYtable/models/studentData.dart';
import 'package:STUDYtable/screens/select_dob.dart';
import 'package:STUDYtable/screens/sign_up_title.dart';
import 'package:STUDYtable/widgets/already_have_an_account_acheck.dart';
import 'package:custom_radio_grouped_button/CustomButtons/ButtonTextStyle.dart';
import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nice_button/NiceButton.dart';

import 'competitive_exams.dart';

class SelectClass extends StatefulWidget {
  final StudentData data;
  SelectClass({Key key, @required this.data}) : super(key: key);

  @override
  _SelectClassState createState() => _SelectClassState();
}

class _SelectClassState extends State<SelectClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignUpTitle(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.35,
                child: CustomRadioButton(
                  elevation: 0,
                  unSelectedColor: Theme.of(context).canvasColor,
                  buttonLables: [
                    'X',
                    'XI',
                    'XII',
                  ],
                  buttonValues: [
                    '10',
                    '11',
                    '12',
                  ],
                  buttonTextStyle: ButtonTextStyle(
                    selectedColor: Colors.white,
                    unSelectedColor: Colors.black,
                    textStyle: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  selectedBorderColor: Colors.white10,
                  selectedColor: Theme.of(context).accentColor,
                  horizontal: true,
                  enableShape: true,
                  height: MediaQuery.of(context).size.width * 0.18,
                  spacing: 0,
                  radioButtonValue: (value) {
                    setState(() {
                      widget.data.standard = value;
                    });

                    print(widget.data.standard);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NiceButton(
                  radius: 50,
                  mini: true,
                  width: MediaQuery.of(context).size.width * 0.15,
                  // padding: const EdgeInsets.all(15),
                  gradientColors: [Colors.purple[100], Colors.amber[100]],
                  text: null,
                  // icon: Icons.navigate_next,
                  icon: FontAwesomeIcons.arrowLeft,
                  iconColor: Colors.deepPurple,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectDob(data: widget.data)),
                    );
                  },
                  background: null,
                ),
                NiceButton(
                  radius: 50,
                  mini: true,
                  width: MediaQuery.of(context).size.width * 0.15,
                  // padding: const EdgeInsets.all(15),
                  gradientColors: [Colors.purple[100], Colors.amber[100]],
                  text: null,
                  // icon: Icons.navigate_next,
                  icon: FontAwesomeIcons.arrowRight,
                  iconColor: Colors.deepPurple,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CompetitiveExams(data: widget.data)),
                    );
                  },
                  background: null,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GotoLoginPage(),
          ],
        ),
      ),
    );
  }
}
