import 'dart:io';

import 'package:easyscan/capture_image.dart';
import 'package:flutter/material.dart';
import 'package:easyscan/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  Map data = {};

  List files = new List();
  var image;

  void getData(file) async
  {
    var contents;
    contents = await file.readAsString();

    String temp = "";
    int i;
    for(i=0;i<contents.length;i++)
    {
      if(contents[i]!='\n') {
        temp += contents[i];
      }
      else{
        setState(() {
          files.add(temp);
        });
        temp="";
      }
    }
  }

  void savedata(file) async
  {
    var sink = file.openWrite(mode: FileMode.append);
    sink.write('$image\n');
    await sink.flush();
    await sink.close();
    if(mounted) {
      setState(() {
        files.add(image);
      });
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      setState(() {
        data = ModalRoute.of(context).settings.arguments;
      });
      getData(data['file']);
    });
  }


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: lightprimarycolor,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        shape: RoundedRectangleBorder(),
        elevation: 10.0,
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              final pdf = await makePdf(files);
              var pdfPath = await save_pdf(pdf, data['file']);
              print(pdfPath);
              Navigator.pushNamed(context, '/view_pdf',arguments: {
                'docpath': pdfPath,
              });
//              PdfPreview(build: (PdfPageFormat format) async => pdf);
            },
            icon: Icon(
              Icons.picture_as_pdf,
              color: lightprimarycolor,
              size: 30.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: files.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
//                  print(files[index]);
                },
                title: Text('${index+1}'),
                leading: Image.file(File(files[index]),height: 40.0,width: 40.0),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Container(
        height: size.height * 0.1,
        width: size.height * 0.22,
        decoration: BoxDecoration(
          color: Colors.blue[800],
          borderRadius: BorderRadius.circular(30),
        ),

        child: Row(
          children: <Widget>[
            FloatingActionButton(
              heroTag: "btn-1",
              onPressed: () async {
                image = await EdgeDetectedImage();
                image == null ? setState(() {}) : savedata(data['file']);
              },
              foregroundColor: lightprimarycolor,
              backgroundColor: Colors.blue[800],
              elevation: 0.0,
              child: Icon(
                Icons.photo_camera,
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: VerticalDivider(color: lightprimarycolor),
            ),

            FloatingActionButton(
              heroTag: "btn-2",
              onPressed: () async {
                image = await pickImage(ImageSource.gallery);
                image == null ? setState(() {}) : savedata(data['file']);
              },
              foregroundColor: lightprimarycolor,
              backgroundColor: Colors.blue[800],
              elevation: 0.0,
              child: Icon(
                Icons.photo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

