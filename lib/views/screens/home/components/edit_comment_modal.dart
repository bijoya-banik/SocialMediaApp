import 'package:flutter/material.dart';
import 'package:social/views/global_components/k_button.dart';
import 'package:social/views/global_components/user_profile_picture.dart';
import 'package:social/views/styles/b_style.dart';

class EditCommentModal extends StatefulWidget {
  final bool isReply;
  const EditCommentModal({this.isReply = false});

  @override
  _EditCommentModalState createState() => _EditCommentModalState();
}

class _EditCommentModalState extends State<EditCommentModal> {
  TextEditingController msgController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back_ios, size: 16, color: KColor.black),
                  ),
                  Expanded(
                    child: Text(
                      widget.isReply ? "Edit Reply" : "Edit Comment",
                      textAlign: TextAlign.center,
                      style: KTextStyle.subtitle2,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: KColor.grey, height: 1),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  UserProfilePicture(avatarRadius: 17, iconSize: 16.5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(color: KColor.appBackground, borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: msgController,
                                autofocus: true,
                                maxLines: 15,
                                minLines: 1,
                                cursorColor: KColor.grey,
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  hintText: widget.isReply ? "Write a reply..." : "Write a comment...",
                                  hintStyle: TextStyle(color: KColor.black54),
                                  contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
                                  border: InputBorder.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10, top: 10),
                  width: KSize.getWidth(context, 75),
                  child: KButton(
                    title: 'Cancel',
                    color: KColor.grey350,
                    textColor: KColor.black,
                    innerPadding: 10,
                    onPressedCallback: () => Navigator.pop(context),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10, top: 10),
                  width: KSize.getWidth(context, 75),
                  child: KButton(
                    title: 'Save',
                    innerPadding: 10,
                    onPressedCallback: () => Navigator.pop(context),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
