import 'package:STUDYtable/models/studentData.dart';
import 'package:STUDYtable/screens/sign_up_mobile.dart';
import 'package:STUDYtable/screens/sign_up_name.dart';
import 'package:STUDYtable/screens/sign_up_title.dart';
import 'package:STUDYtable/widgets/already_have_an_account_acheck.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nice_button/NiceButton.dart';
import 'package:toast/toast.dart';

class Email extends StatefulWidget {
  final StudentData data;
  Email({Key key, @required this.data}) : super(key: key);

  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  final _text = TextEditingController();

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TextEditingController _emailController = new TextEditingController();
    // _emailController.text = widget.data.email;

    _text.text = widget.data.email;

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
                    hintText: 'Email',
                    errorText: validateEmail(_text.text)
                        ? 'Please enter a valid Email'
                        : null,
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
                      // widget.data.email = _emailController.text;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Name(data: widget.data)),
                      );
                    },
                    background: null,
                  ),
                  NiceButton(
                    radius: 50,
                    mini: true,
                    width: MediaQuery.of(context).size.width * 0.15,
                    padding: const EdgeInsets.all(15),
                    gradientColors: [Colors.purple[100], Colors.amber[100]],
                    icon: FontAwesomeIcons.arrowRight,
                    iconColor: Colors.deepPurple,
                    text: 'null',
                    onPressed: () {
                      setState(() {
                        if (validateEmail(_text.text)) {
                          widget.data.email = _text.text;
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Mobile(data: widget.data)),
                          );
                        } else {
                          Toast.show("Please Enter a valid Email", context,
                              duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
                        }
                      });
                      print(widget.data.name);
                      print(widget.data.email);
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
