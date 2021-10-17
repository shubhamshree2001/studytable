import 'package:STUDYtable/models/studentData.dart';
import 'package:STUDYtable/screens/sign_up_goal.dart';
import 'package:STUDYtable/screens/sign_up_title.dart';
import 'package:STUDYtable/screens/signup_select_class.dart';
import 'package:STUDYtable/widgets/already_have_an_account_acheck.dart';
import 'package:dropdown_date_picker/dropdown_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nice_button/nice_button.dart';

class SelectDob extends StatefulWidget {
  final StudentData data;
  SelectDob({Key key, @required this.data}) : super(key: key);

  static final now = DateTime.now();

  final dropdownDatePicker = DropdownDatePicker(
    underLine: Container(
      color: Colors.black,
    ),
    dateFormat: DateFormat.dmy,
    textStyle: TextStyle(
      fontSize: 25,
    ),
    firstDate: ValidDate(year: now.year - 30, month: 1, day: 1),
    lastDate: ValidDate(year: now.year, month: now.month, day: now.day),
  );

  @override
  _SelectDobState createState() => _SelectDobState();
}

class _SelectDobState extends State<SelectDob> {
  @override
  Widget build(BuildContext context) {
    //to send data to backend

    // String dob = '$day/$month/$year';

    // setState(() {
    //   int day = widget.dropdownDatePicker.day;
    // int month = widget.dropdownDatePicker.month;
    // int year = widget.dropdownDatePicker.year;
    // });

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignUpTitle(),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Select Date of birth',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  color: Colors.red,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              widget.dropdownDatePicker,
              const SizedBox(
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
                            builder: (context) => Goal(data: widget.data)),
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
                      // widget.data.email = _goalController.text;
                      setState(() {
                        widget.data.dob =
                            widget.dropdownDatePicker.getDate().toString();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectClass(
                              data: widget.data,
                            ),
                          ),
                        );
                      });
                      print(widget.data.dob);
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
