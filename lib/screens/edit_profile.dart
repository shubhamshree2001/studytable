import 'dart:io';

import 'package:STUDYtable/anim/custom_routes.dart';
import 'package:STUDYtable/models/studentData.dart';
import 'package:STUDYtable/screens/my_studytable.dart';
import 'package:STUDYtable/widgets/footer.dart';
import 'package:STUDYtable/widgets/user_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  final StudentData data;
  EditProfile({this.data});
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Widget _buildTextField(String initValue, String labelText) {
    return TextFormField(
      cursorColor: Colors.black,
      initialValue: initValue,
      decoration: InputDecoration(
        labelText: labelText,
        fillColor: Colors.black,
        focusColor: Colors.black,
        hoverColor: Colors.black,
        labelStyle: GoogleFonts.lato(
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  File _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

//submit after editing
  void _submitDetails() {
    if (_userImageFile != null) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Please pick an Image'),
        ),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              // _submitDetails();
              Navigator.of(context).pushReplacement(
                CustomRoute(
                  builder: (ctx) => MyStudytable(),
                ),
              );
            },
            child: Container(
              child: Icon(Icons.done),
              margin: EdgeInsets.only(
                right: 8,
              ),
            ),
          ),
        ],
        title: Text(
          'Edit Profile',
          style: GoogleFonts.lato(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.purple[100],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: UserImagePicker(_pickedImage),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    _buildTextField('Gopal Gaur', 'Name'),
                    _buildTextField('iamgopalgaur', 'Username'),
                    _buildTextField('gopalgaur95@gmail.com', 'Email'),
                    _buildTextField('8209203870', 'Phone'),
                    _buildTextField(
                        'My goal is to get into IIT Bombay', 'Goal'),
                    _buildTextField('St. Xavier\'s School', 'School'),
                    _buildTextField('XII', 'Class'),
                    _buildTextField('Bangalore', 'City'),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: FooterSection(),
                height: MediaQuery.of(context).size.height * 0.15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
