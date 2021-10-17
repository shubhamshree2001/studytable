import 'package:button3d/button3d.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewDeadline extends StatefulWidget {
  final Function addDl;
  NewDeadline(this.addDl);

  @override
  _NewDeadlineState createState() => _NewDeadlineState();
}

class _NewDeadlineState extends State<NewDeadline> {
  final _titleController = TextEditingController();

  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty || _selectedDate == null) {
      return;
    }

    widget.addDl(enteredTitle, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2022))
        .then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _selectedDate = pickedDate;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
                autocorrect: true,
                autofocus: true,
                controller: _titleController,
                keyboardType: TextInputType.name,
                onSubmitted: (_) => _submitData(),
              ),

              //Date Picker
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen!'
                            : 'Date: ${DateFormat.yMMMd().format(_selectedDate)}',
                        style: GoogleFonts.lato(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        _selectedDate == null ? 'Choose Date' : 'Change Date',
                        style: GoogleFonts.lato(
                          color: Colors.red,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Button3d(
                onPressed: _submitData,
                child: Text(
                  'Add Deadline',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                height: 55,
                width: 135,
                style: Button3dStyle.BLUE,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
