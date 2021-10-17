import 'package:STUDYtable/anim/custom_routes.dart';
import 'package:STUDYtable/models/studentData.dart';
import 'package:STUDYtable/screens/final.dart';
import 'package:STUDYtable/screens/sign_up_name.dart';
import 'package:STUDYtable/widgets/already_have_an_account_acheck.dart';
import 'package:STUDYtable/widgets/rounded_input_field.dart';
import 'package:STUDYtable/widgets/rounded_password_field.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:STUDYtable/configuration/amplifyconfiguration.dart';
import 'package:nepninja/nepninja.dart';

//This is the background design on sign_in page
class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Here");
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "lib/assets/images/main_top.png",
                width: size.width * 0.35,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "lib/assets/images/login_bottom.png",
                width: size.width * 0.4,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}

class LoginScreenBody extends StatefulWidget {
  // final StudentData data;
  LoginScreenBody({
    Key key,
    // this.data,
  }) : super(key: key);

  @override
  _LoginScreenBodyState createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool loggedIn = false;
  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(content: new Text('Invalid Email or Password')));
  }

  Future<String> _authUser() async {
    try {
      SignInResult res = await Amplify.Auth.signIn(
          username: _emailController.text, password: _passwordController.text);
      if (res.isSignedIn) {
        _navigate();
        return "Signed In";
      } else {
        return "Unable to Sign In";
      }
    } on AuthError catch (error) {
      print(error.cause);
      return "Unable to Sign In";
    }
  }

  Amplify amplifyInstance = new Amplify();

  @override
  void initState() {
    _configureAmplify();
    super.initState();
  }
  // bool _amplifyConfigured = false;

  void _configureAmplify() async {
    if (!mounted) return;

    // Add Pinpoint and Cognito Plugins, or any other plugins you want to use
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    amplifyInstance.addPlugin(
      authPlugins: [authPlugin],
    );

    // Once Plugins are added, configure Amplify
    await amplifyInstance.configure(amplifyconfig);
    try {
      CognitoAuthSession session = await Amplify.Auth.fetchAuthSession();
      if (session.isSignedIn) {
        setState(() {
          // _amplifyConfigured = true;
          loggedIn = true;
        });
      } else {
        setState(() {
          loggedIn = false;
        });
      }
      print(loggedIn);
    } catch (e) {
      print(e);
    }
  }

  final newStudent = new StudentData(
    id: null,
    name: null,
    email: null,
    mobile: null,
    username: null,
    goal: null,
    subjects: null,
    dob: null,
    compexams: null,
    standard: null,
  );

  void _navigate() {
    Navigator.of(context).pushReplacement(
      CustomRoute(
        builder: (ctx) => FinalPersonal(
          data: newStudent,
        ),
      ),
    );
  }

  void makeRequest(Function navigate) {
    Future.delayed(Duration(milliseconds: 2500), () {
      _navigate();
    });
  }

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var scaffold = Scaffold(
      key: _scaffoldKey,
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.08,
                          color: Colors.black),
                      text: 'STUDY',
                    ),
                    TextSpan(
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.15,
                          color: Colors.black),
                      text: 'table',
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.06),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
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
                  onChanged: (value) {
                    // ignore: unnecessary_statements
                    _authUser;
                  },
                  controller: _emailController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
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
                  onChanged: (value) {
                    // ignore: unnecessary_statements
                    _authUser;
                  },
                  controller: _passwordController,
                ),
              ),
              // RoundedPasswordField(
              //   onChanged: (value) {
              //     // ignore: unnecessary_statements
              //     _authUser;
              //   },

              // ),
              SizedBox(height: size.height * 0.03),
              CircularProgressButton(
                height: size.height * 0.1,
                width: size.width * 0.7,
                borderRadius: 30,
                backgroundColor: Color(0xff6f35a5),
                fadeDurationInMilliSecond: 400,
                text: "Sign In",
                fontSize: MediaQuery.of(context).size.width * 0.06,
                progressIndicatorColor: Colors.white,
                onTap: (navigate) {
                  // ignore: unnecessary_statements
                  _authUser();
                  // makeRequest(navigate);
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Name(data: newStudent);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
    // : FinalPersonal();
    return loggedIn ? FinalPersonal() : scaffold;
  }
}
