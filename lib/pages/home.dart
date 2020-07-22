import 'dart:io';

import 'package:flutter/material.dart';
import 'package:easyscan/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../loading.dart';


class HomeScreen extends StatefulWidget {

  final List<FileSystemEntity> alldata;
  HomeScreen({this.alldata});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var image;

  void savedata(file) async
  {
    var sink = file.openWrite(mode: FileMode.append);
    sink.write('$image\n');
    await sink.flush();
    await sink.close();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: lightprimarycolor,
      appBar: AppBar(
        backgroundColor: lightprimarycolor,
        title: Text(
            'EasyScan',
          style: TextStyle(
            color: primarycolor,
            letterSpacing: 1,
          ),
        ),
        shape: RoundedRectangleBorder(),
        elevation: 10.0,
      ),

      body: ListView.builder(
        reverse: false,
        itemCount: widget.alldata.length,
        itemBuilder: (context,index) {

            File file = widget.alldata[index];
            var contents;
            contents = file.readAsStringSync();

            String temp = "";
            for(int i=0;i<contents.length;i++)
            {
              if(contents[i]!='\n') {
                temp += contents[i];
              }
              else{
                break;
              }
            }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  Navigator.of(context).pushNamed("/details",arguments: {'file': widget.alldata[index]});
                },
                title: Text(basename(widget.alldata[index].toString())),
                leading: Image.file(File(temp)),
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
                if(image == null)
                  setState(() {});
                else{
                  var _directory = await getApplicationDocumentsDirectory();
                  await File('${_directory.path}/data/data[${widget.alldata.length}]').create(recursive: true);
                  File file = File('${_directory.path}/data/data[${widget.alldata.length}]');
                  savedata(file);
                  Future pushNamed = Navigator.of(context).pushNamed("/details",arguments: {'file': file});
                  if(mounted) {
                    pushNamed.then((_) =>
                        setState(() {
                          widget.alldata.add(file);
                        }));
                  }
                }
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
                if(image == null)
                  setState(() {});
                else{
                  var _directory = await getApplicationDocumentsDirectory();
                  await File('${_directory.path}/data/data[${widget.alldata.length}]').create(recursive: true);
                  File file = File('${_directory.path}/data/data[${widget.alldata.length}]');
                  savedata(file);
                  Future pushNamed = Navigator.of(context).pushNamed("/details",arguments: {'file': file});
                  if(mounted) {
                    pushNamed.then((_) =>
                        setState(() {
                          widget.alldata.add(file);
                        }));
                  }
                }
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
