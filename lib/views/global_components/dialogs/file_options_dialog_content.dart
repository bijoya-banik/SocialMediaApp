import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social/services/asset_service.dart';
import 'package:social/views/styles/b_style.dart';

// ignore: must_be_immutable
class FileOptionsDialogContent extends StatelessWidget {
  FileOptionsDialogContent();

  List attachmentOptions = [
    {'title': 'Camera', 'icon': CupertinoIcons.camera_fill},
    {'title': 'Gallery', 'icon': Icons.image},
    {'title': 'Document', 'icon': Icons.file_copy},
    {'title': 'Location', 'icon': Icons.location_pin},
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width - 35,
        margin: EdgeInsets.only(bottom: 70),
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 20),
        decoration: BoxDecoration(color: KColor.white, borderRadius: BorderRadius.circular(10)),
        child: Wrap(
          runSpacing: 15,
          spacing: 20,
          alignment: WrapAlignment.center,
          children: List.generate(
            attachmentOptions.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  if (attachmentOptions[index]['title'] == 'Camera') AssetService.pickImageVideo(false, context, ImageSource.camera);

                  if (attachmentOptions[index]['title'] == 'Gallery') AssetService.pickImageVideo(false, context, ImageSource.gallery);

                  if (attachmentOptions[index]['title'] == 'Document') AssetService.pickMedia(false, context, true, false);
                },
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: KColor.primary.withOpacity(0.1), borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Icon(attachmentOptions[index]['icon'], color: KColor.primary),
                    ),
                    Container(margin: EdgeInsets.symmetric(vertical: 5), child: Text(attachmentOptions[index]['title'], style: KTextStyle.caption)),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
