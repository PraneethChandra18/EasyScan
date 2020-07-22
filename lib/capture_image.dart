import 'package:flutter/material.dart';
import 'package:easyscan/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class MultipleFloatingButton extends StatefulWidget {
  const MultipleFloatingButton({
    Key key,
    @required this.size,this.type
  }) : super(key: key);

  final Size size;
  final String type;

  @override
  _MultipleFloatingButtonState createState() => _MultipleFloatingButtonState();
}

class _MultipleFloatingButtonState extends State<MultipleFloatingButton> {

  var image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.1,
      width: widget.size.height * 0.22,
      decoration: BoxDecoration(
        color: Colors.blue[800],
        borderRadius: BorderRadius.circular(30),
      ),

      child: Row(
        children: <Widget>[
          FloatingActionButton(
            onPressed: () async {
              image = await EdgeDetectedImage();
//              if(widget.type=='new')
//              {
//                var sink = widget.file.openWrite(mode: FileMode.append);
//                sink.write('\n');
//                sink.write(image);
//                await sink.flush();
//                await sink.close();
//              }
              print(image);
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
            onPressed: () async {
              image = await pickImage(ImageSource.gallery);
              print(image);
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
    );
  }
}
