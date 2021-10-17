import 'package:STUDYtable/models/studentData.dart';
import 'package:STUDYtable/screens/select_dob.dart';
import 'package:STUDYtable/screens/sign_up_title.dart';
import 'package:STUDYtable/screens/sign_up_username.dart';
import 'package:STUDYtable/widgets/already_have_an_account_acheck.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nice_button/NiceButton.dart';

class Goal extends StatefulWidget {
  final StudentData data;
  Goal({Key key, @required this.data}) : super(key: key);

  @override
  _GoalState createState() => _GoalState();
}

class _GoalState extends State<Goal> {
  final _text = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TextEditingController _goalController = new TextEditingController();
    // _goalController.text = widget.data.goal;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignUpTitle(),
              Padding(
                padding: const EdgeInsets.all(50),
                child: TextField(
                  controller: _text,
                  decoration: InputDecoration(
                    hintText: 'What\'s your goal?',
                    errorText: _validate ? 'Goal can\'t be empty' : null,
                    labelStyle: new TextStyle(
                      color: const Color(0xFF424242),
                      fontSize: 25,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
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
                      widget.data.email = _text.text;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Username(data: widget.data)),
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
                      setState(() {
                        setState(() {
                          if (_text.text.isEmpty) {
                            _validate = true;
                          } else {
                            _validate = false;
                            widget.data.goal = _text.text;
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SelectDob(data: widget.data)),
                            );
                          }
                        });
                      });
                    },
                    background: null,
                  ),
                ],
              ),
              GotoLoginPage(),
            ],
          ),
        ),
      ),
    );
  }
}
