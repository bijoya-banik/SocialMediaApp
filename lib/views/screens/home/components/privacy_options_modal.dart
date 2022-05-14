import 'package:flutter/material.dart';
import 'package:social/views/styles/b_style.dart';

class PrivacyOptionsModal extends StatelessWidget {
  const PrivacyOptionsModal();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
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
              child: Icon(Icons.public, color: KColor.black),
            ),
            title: Text('Public'),
            onTap: () {
              Navigator.pop(context);
            },
            trailing: Icon(Icons.check, color: KColor.black54),
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 23.0,
              backgroundColor: KColor.black.withOpacity(0.1),
              child: Icon(Icons.group, color: KColor.black),
            ),
            title: Text('Friends'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 23.0,
              backgroundColor: KColor.black.withOpacity(0.1),
              child: Icon(Icons.lock, color: KColor.black),
            ),
            title: Text('Only Me'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
