import 'package:STUDYtable/widgets/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: Color(0xff6f35a5),
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Color(0xff6f35a5),
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Color(0xff6f35a5),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
