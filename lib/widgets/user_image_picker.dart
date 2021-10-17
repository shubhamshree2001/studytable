import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  //preparing file upload and validating

  UserImagePicker(this.imagePickFn);
  final void Function(File pickedImage) imagePickFn;
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;
  void _pickImageCamera() async {
    final pickedImageFile =
        // ignore: deprecated_member_use
        await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    widget.imagePickFn(pickedImageFile);
  }

  void _pickImageGallery() async {
    final pickedImageFile =
        // ignore: deprecated_member_use
        await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    widget.imagePickFn(pickedImageFile);
  }

  void _selectModeOfChoosing() async {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 110,
                height: 110,
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.camera,
                        size: 60,
                      ),
                      onPressed: () => _pickImageCamera,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '\t\t\t\t\t\t\t\tCamera',
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 110,
                height: 110,
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.photo,
                        size: 60,
                      ),
                      onPressed: _pickImageGallery,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('\t\t\t\t\t\t\t\tGallery'),
                  ],
                ),
              ),
            ],
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          // backgroundColor: Colors.grey,
          radius: MediaQuery.of(context).size.width * 0.15,
          backgroundImage: _pickedImage != null
              ? FileImage(_pickedImage)
              : AssetImage('lib/assets/images/faceicon.png'),
        ),
        FlatButton.icon(
          onPressed: _selectModeOfChoosing,
          icon: Icon(Icons.image),
          label: _pickedImage != null
              ? Text('Change Avatar')
              : Text('Add your Avatar'),
          textColor: Colors.black,
        )
      ],
    );
  }
}
