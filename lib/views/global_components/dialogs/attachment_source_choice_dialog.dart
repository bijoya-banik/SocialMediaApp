import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social/views/styles/b_style.dart';

class AttachmentSourceChoiceDialog extends StatefulWidget {
  final bool isAllowFiles;

  const AttachmentSourceChoiceDialog({this.isAllowFiles = false});

  @override
  _AttachmentSourceChoiceDialogState createState() => _AttachmentSourceChoiceDialogState();
}

class _AttachmentSourceChoiceDialogState extends State<AttachmentSourceChoiceDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      title: Text("Select attachment source:", style: KTextStyle.subtitle1.copyWith(fontWeight: FontWeight.w500)),
      actions: <Widget>[
        MaterialButton(
          padding: EdgeInsets.zero,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: KColor.primary.withOpacity(0.1), borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Icon(CupertinoIcons.camera_fill, color: KColor.primary)),
                SizedBox(height: 5),
                Text("Camera", style: KTextStyle.caption),
                SizedBox(height: 5),
              ],
            ),
          ),
          onPressed: () => Navigator.pop(context, ImageSource.camera),
        ),
        MaterialButton(
          padding: EdgeInsets.zero,
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: KColor.primary.withOpacity(0.1), borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Icon(Icons.image, color: KColor.primary)),
              SizedBox(height: 5),
              Text("Gallery", style: KTextStyle.caption),
              SizedBox(height: 5),
            ],
          ),
          onPressed: () => Navigator.pop(context, ImageSource.gallery),
        ),
        if (widget.isAllowFiles)
          MaterialButton(
            padding: EdgeInsets.zero,
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: KColor.primary.withOpacity(0.1), borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Icon(Icons.file_copy, color: KColor.primary, size: 35)),
                SizedBox(height: 5),
                Text("Files", style: KTextStyle.caption),
                SizedBox(height: 5),
              ],
            ),
            onPressed: () => Navigator.pop(context, 'file'),
          )
      ],
    );
  }
}
