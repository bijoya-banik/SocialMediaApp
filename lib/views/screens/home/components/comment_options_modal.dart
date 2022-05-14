//

import 'package:flutter/material.dart';
import 'package:social/views/screens/home/components/edit_comment_modal.dart';
import 'package:social/views/styles/b_style.dart';

class CommentOptionsModal extends StatelessWidget {
  final bool isReply;
  const CommentOptionsModal({this.isReply = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        children: <Widget>[
          Center(
              child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  width: 65,
                  height: 5,
                  decoration: BoxDecoration(color: KColor.grey200, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(25)))),
          ListTile(
            leading: CircleAvatar(
              radius: 23.0,
              backgroundColor: KColor.black.withOpacity(0.1),
              child: Icon(Icons.edit, color: KColor.black),
            ),
            title: Text('Edit'),
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                  context: context,
                  isDismissible: false,
                  elevation: 5,
                  isScrollControlled: true,
                  useRootNavigator: true,
                  backgroundColor: KColor.white,
                  builder: (context) {
                    return EditCommentModal(isReply: isReply);
                  });
            },
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 23.0,
              backgroundColor: KColor.red.withOpacity(0.1),
              child: Icon(Icons.delete, color: KColor.red),
            ),
            title: Text('Delete'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
