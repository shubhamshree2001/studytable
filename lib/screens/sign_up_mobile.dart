import 'package:STUDYtable/models/studentData.dart';
import 'package:STUDYtable/screens/sign_up_email.dart';
import 'package:STUDYtable/screens/sign_up_title.dart';
import 'package:STUDYtable/screens/sign_up_username.dart';
import 'package:STUDYtable/widgets/already_have_an_account_acheck.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nice_button/NiceButton.dart';

class Mobile extends StatefulWidget {
  final StudentData data;
  Mobile({Key key, @required this.data}) : super(key: key);

  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  TextEditingController _text = new TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TextEditingController _mobileController = new TextEditingController();
    // _mobileController.text = widget.data.mobile;
    _text.text = widget.data.mobile;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignUpTitle(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: TextField(
                  controller: _text,
                  decoration: InputDecoration(
                    hintText: 'Mobile',
                    errorText: _validate ? 'Mobile can\'t be empty' : null,
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
              Column(
                children: [
                  Text(
                    '"Remember, This will be your password"',
                    style: GoogleFonts.lato(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Colors.red[900],
                    ),
                  ),
                  Text(
                    'Please Enter your Mobile no. with Country Code(E.g. +91 for India)',
                    style: GoogleFonts.lato(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      color: Colors.red[900],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
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
                            builder: (context) => Email(data: widget.data)),
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
                        if (_text.text.isEmpty) {
                          _validate = true;
                        } else {
                          _validate = false;
                          widget.data.mobile = _text.text;
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Username(data: widget.data)),
                          );
                        }
                      });
                      print(widget.data.mobile);
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
