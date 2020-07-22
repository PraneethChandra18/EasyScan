import 'dart:io';

import 'package:easyscan/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';


class view_pdf extends StatefulWidget {
  @override
  _view_pdfState createState() => _view_pdfState();
}

class _view_pdfState extends State<view_pdf> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return PDFViewerScaffold(
      path: data['docpath'],
      appBar: AppBar(
        title: Text('PDF Viewer'),
        actions: <Widget>[
          IconButton(
            onPressed: () async {

            },
            icon: Icon(Icons.share,color: lightprimarycolor),
          ),
        ],
      ),
    );
  }
}
