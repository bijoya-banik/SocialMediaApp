import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/views/styles/b_style.dart';

class MessageOptionsModal extends StatelessWidget {
  final bool isPlatformIos;
  const MessageOptionsModal({this.isPlatformIos = false});

  @override
  Widget build(BuildContext context) {
    return isPlatformIos
        ? CupertinoActionSheet(
            // title: const Text('Log out?'),
            // message: _logoutMessage,

            actions: [
              CupertinoActionSheetAction(
                child: const Text('Mark as read'),
                onPressed: () => Navigator.pop(context),
              ),
              CupertinoActionSheetAction(
                child: const Text('Delete'),
                isDestructiveAction: true,
                onPressed: () => Navigator.pop(context),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text('Cancel'),
              isDefaultAction: true,
              onPressed: () => Navigator.pop(context),
            ),
          )
        : Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    width: 65,
                    height: 5,
                    decoration: BoxDecoration(color: KColor.grey200, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(25)),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 23,
                    backgroundColor: KColor.red.withOpacity(0.1),
                    child: Icon(Icons.delete, color: KColor.red),
                  ),
                  title: Text('Delete'),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 23,
                    backgroundColor: KColor.green.withOpacity(0.1),
                    child: Icon(Icons.done_all, color: KColor.green),
                  ),
                  title: Text('Mark as read'),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          );
  }
}
