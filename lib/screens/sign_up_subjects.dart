import 'package:STUDYtable/models/studentData.dart';
import 'package:STUDYtable/screens/competitive_exams.dart';
import 'package:STUDYtable/screens/confirm_sign_up.dart';
import 'package:STUDYtable/screens/sign_up_title.dart';
import 'package:STUDYtable/widgets/already_have_an_account_acheck.dart';
import 'package:custom_radio_grouped_button/CustomButtons/ButtonTextStyle.dart';
import 'package:custom_radio_grouped_button/CustomButtons/CustomCheckBoxGroup.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nice_button/NiceButton.dart';

class SelectSubjects extends StatefulWidget {
  final StudentData data;
  SelectSubjects({Key key, @required this.data}) : super(key: key);

  @override
  _SelectSubjectsState createState() => _SelectSubjectsState();
}

class _SelectSubjectsState extends State<SelectSubjects> {
  @override
  Widget build(BuildContext context) {
    var subjects = [
      "PHYSICS",
      "CHEMISTRY",
      "MATHEMATICS",
      "ENGLISH",
      "HINDI",
      "COMPUTER SCIENCE",
      "BIOLOGY",
    ];
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignUpTitle(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.5,
                child: CustomCheckBoxGroup(
                  buttonTextStyle: ButtonTextStyle(
                    selectedColor: Colors.white,
                    unSelectedColor: Colors.black,
                    textStyle: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  unSelectedColor: Theme.of(context).canvasColor,
                  buttonLables: subjects,
                  buttonValuesList: subjects,
                  checkBoxButtonValues: (values) {
                    setState(() {
                      widget.data.subjects = values;
                    });
                    print(values);
                  },
                  spacing: 0,
                  selectedBorderColor: Colors.white10,
                  horizontal: true,
                  selectedColor: Theme.of(context).accentColor,
                  enableShape: true,
                  height: MediaQuery.of(context).size.width * 0.18,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.075,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NiceButton(
                  mini: true,
                  radius: 50,
                  text: null,
                  width: MediaQuery.of(context).size.width * 0.15,
                  padding: const EdgeInsets.all(15),
                  gradientColors: [Colors.purple[100], Colors.amber[100]],
                  icon: FontAwesomeIcons.arrowLeft,
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
                NiceButton(
                  mini: true,
                  radius: 50,
                  text: null,
                  width: MediaQuery.of(context).size.width * 0.15,
                  padding: const EdgeInsets.all(15),
                  gradientColors: [Colors.purple[100], Colors.amber[100]],
                  icon: FontAwesomeIcons.check,
                  iconColor: Colors.deepPurple,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfrimSignUp(data: widget.data),
                      ),
                    );
                  },
                  background: null,
                ),
              ],
            ),
            GotoLoginPage(),
          ],
        ),
      ),
    );
  }
}
