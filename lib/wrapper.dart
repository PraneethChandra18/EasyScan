import 'package:easyscan/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'authenticate/authenticate.dart';
import 'dart:io';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  var _directory;
  List<FileSystemEntity> alldata;

  void getfilesdata() async
  {
    _directory = await getApplicationDocumentsDirectory();
    await Directory('${_directory.path}/data').create(recursive: true);
    alldata = Directory('${_directory.path}/data').listSync();
    await Directory('${_directory.path}/documents').create(recursive: true);
  }


//    if(await File('${_directory.path}/data.txt').exists())
//    {
//      return File('${_directory.path}/data.txt');
//    }
//    else
//    {
//      await File('${_directory.path}/data.txt').create(recursive: true);
//      return File('${_directory.path}/data.txt');
//    }

  /*
    For deletion of file
    ------------------------
    File('path/to/sample.txt').delete(recursive: true);
  */


  @override
  void initState() {
    super.initState();
    getfilesdata();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen(alldata: alldata);
  }
}

