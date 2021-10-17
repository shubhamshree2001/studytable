import 'package:STUDYtable/models/studentData.dart';
import 'package:STUDYtable/screens/sign_up_subjects.dart';
import 'package:STUDYtable/screens/sign_up_title.dart';
import 'package:STUDYtable/screens/signup_select_class.dart';
import 'package:STUDYtable/widgets/already_have_an_account_acheck.dart';
import 'package:custom_radio_grouped_button/CustomButtons/CustomCheckBoxGroup.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nice_button/NiceButton.dart';

class CompetitiveExams extends StatefulWidget {
  final StudentData data;
  CompetitiveExams({Key key, @required this.data}) : super(key: key);

  @override
  _CompetitiveExamsState createState() => _CompetitiveExamsState();
}

class _CompetitiveExamsState extends State<CompetitiveExams> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var buttons = [
      "JEE-Mains",
      "NEET",
      "AIIMS",
      "JEE-Advanced",
    ];
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignUpTitle(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.075,
            ),
            MediaQuery.removePadding(
              removeTop: true,
              removeBottom: true,
              context: context,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.4,
                child: CustomCheckBoxGroup(
                  buttonTextStyle: ButtonTextStyle(
                    selectedColor: Colors.white,
                    unSelectedColor: Colors.black,
                    textStyle: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  unSelectedColor: Theme.of(context).canvasColor,
                  buttonLables: buttons,
                  buttonValuesList: buttons,
                  checkBoxButtonValues: (values) {
                    setState(() {
                      widget.data.compexams = values;
                    });
                    print(values);
                  },
                  spacing: 0,
                  selectedBorderColor: Colors.white10,
                  horizontal: true,
                  selectedColor: Theme.of(context).accentColor,
                  enableShape: true,
                  height: MediaQuery.of(context).size.width * 0.17,
                ),
              ),
            ),
            SizedBox(
              height: 10,
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
                          builder: (context) => SelectClass(data: widget.data)),
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
                  icon: FontAwesomeIcons.arrowRight,
                  iconColor: Colors.deepPurple,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SelectSubjects(data: widget.data)),
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
