import 'package:STUDYtable/models/studentData.dart';
import 'package:STUDYtable/screens/sign_up_email.dart';
import 'package:STUDYtable/screens/sign_up_title.dart';
import 'package:STUDYtable/widgets/already_have_an_account_acheck.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nice_button/NiceButton.dart';

class Name extends StatefulWidget {
  final StudentData data;
  Name({Key key, @required this.data}) : super(key: key);

  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<Name> {
  TextEditingController _text = new TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _text.text = widget.data.name;
    var mediaQuery = MediaQuery.of(context).size;
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
                    hintText: 'Name',
                    errorText: _validate ? 'Name can\'t be empty' : null,
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
              NiceButton(
                radius: 50,
                mini: true,
                width: mediaQuery.width * 0.15,
                gradientColors: [Colors.purple[100], Colors.amber[100]],
                text: null,
                icon: FontAwesomeIcons.arrowRight,
                iconColor: Colors.deepPurple,
                onPressed: () {
                  setState(() {
                    if (_text.text.isEmpty) {
                      _validate = true;
                    } else {
                      _validate = false;
                      widget.data.name = _text.text;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Email(data: widget.data)),
                      );
                    }
                  });
                  print(widget.data.name);
                },
                background: null,
              ),
              GotoLoginPage(),
            ],
          ),
        ),
      ),
    );
  }
}
