import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/views/styles/b_style.dart';

class ProfileInfoTile extends StatelessWidget {
  final String title, value;
  final Icon icon;
  final Function onInlineEdit;
  const ProfileInfoTile({this.title, this.value, this.icon, this.onInlineEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: onInlineEdit != null ? 0 : 5),
      child: Row(
        children: [
          icon,
          SizedBox(width: KSize.getWidth(context, 10)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: KTextStyle.bodyText2.copyWith(color: KColor.black, fontWeight: FontWeight.w500)),
                SizedBox(height: KSize.getHeight(context, 5)),
                Text(title, style: KTextStyle.subtitle2.copyWith(fontWeight: FontWeight.normal, color: KColor.black54)),
              ],
            ),
          ),
          if (onInlineEdit != null) IconButton(onPressed: onInlineEdit, icon: Icon(FlutterIcons.edit_fea, size: 20, color: KColor.black54)),
        ],
      ),
    );
  }
}
