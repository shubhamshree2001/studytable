import 'package:STUDYtable/models/studentData.dart';
import 'package:STUDYtable/screens/final.dart';
import 'package:STUDYtable/screens/sign_up_title.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfrimSignUp extends StatefulWidget {
  final StudentData data;
  ConfrimSignUp({Key key, @required this.data}) : super(key: key);

  @override
  _ConfrimSignUpState createState() => _ConfrimSignUpState();
}

class _ConfrimSignUpState extends State<ConfrimSignUp> {
  final _text = TextEditingController();

  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    print(widget.data);

    try {
      signUp();
    } on AuthError catch (error) {
      print(error.cause);
    } catch (error) {}
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  void confirmSignUp() async {
    SignUpResult result = await Amplify.Auth.confirmSignUp(
        username: widget.data.email,
        // username: ConfrimSignUp.SignUpdetails['email'],
        confirmationCode: _text.text);
    if (result.isSignUpComplete) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => FinalPersonal(
            data: widget.data,
          ),
        ),
      );
    } else {
      //wrong code
    }
  }

  void signUp() async {
    print(widget.data.settoMap());
    SignUpResult signUp = await Amplify.Auth.signUp(
      username: widget.data.email,
      password: widget.data.mobile,
      options: CognitoSignUpOptions(
        userAttributes: widget.data.settoMap(),
      ),
    );
    print(signUp.nextStep);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignUpTitle(),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'You must have recieved a code on your mail.',
                          style: GoogleFonts.lato(
                              color: Colors.red[800], fontSize: 20),
                        ),
                      ),
                    )),
                Container(
                  child: TextField(
                    controller: _text,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: RaisedButton(
                      elevation: 10,
                      color: Colors.orange[100],
                      onPressed: () => confirmSignUp(),
                      child: Text(
                        'Verify',
                        style:
                            GoogleFonts.lato(color: Colors.black, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
