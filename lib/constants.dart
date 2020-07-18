import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

const primarycolor = Color(0xFF162367);
const lightprimarycolor = Color(0xFFedf9f7);

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: primarycolor,backgroundColor: lightprimarycolor),
  fillColor: lightprimarycolor,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: lightprimarycolor,width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(30)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink,width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(30)),
  ),
);

Future captureImage() async {
  var _image;
  final picker = ImagePicker();

  final pickedFile = await picker.getImage(source: ImageSource.camera);
  _image = await pickedFile.readAsBytes();

  return _image;
}

Future importImage() async {
  var _image;
  final picker = ImagePicker();

  final pickedFile = await picker.getImage(source: ImageSource.gallery);
  _image = await pickedFile.readAsBytes();

  return _image;
}