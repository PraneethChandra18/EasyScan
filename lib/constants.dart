import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:edge_detection/edge_detection.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

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

Future pickImage(type) async {
  var _image;
  final picker = ImagePicker();

  final pickedFile = await picker.getImage(source: type);

  pickedFile != null ?_image = pickedFile.path : _image = null;
  return _image;
}

Future EdgeDetectedImage() async {
  var imagePath;
  try {
    imagePath = await EdgeDetection.detectEdge;
  } on PlatformException {
    imagePath = null;
  }

  return imagePath;
}

Future makePdf(ListImages) async
{
  final pdf = pw.Document();
  await ListImages.forEach((imagePath) => imagetopdf(imagePath,pdf));
  return pdf;
}

imagetopdf(imagePath,pdf)
{
  var image;
    image = PdfImage.file(
    pdf.document,
    bytes: File(imagePath).readAsBytesSync(),
  );

  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Image(image),
        ); // Center
      })); // Page
}

Future save_pdf(pdf,file) async
{
  var temp = basename(file.toString()) + '.pdf';

  String docPath="";
  var _directory = await getApplicationDocumentsDirectory();

  final filePath = File("${_directory.path}/documents/${temp}");
  await filePath.writeAsBytes(pdf.save());
  docPath = "${_directory.path}/documents/${temp}";
  return docPath;
}